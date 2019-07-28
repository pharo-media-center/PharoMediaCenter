"
I implement a streaming player for MPEG or MP3 files.
Example of use:
	(StreamingMP3Sound onFileNamed: 'song.mp3') play.

"
Class {
	#name : #StreamingMP3Sound,
	#superclass : #AbstractSound,
	#instVars : [
		'volume',
		'repeat',
		'mpegFile',
		'mpegStreamIndex',
		'totalSamples',
		'streamSamplingRate',
		'mixer',
		'lastBufferMSecs',
		'mutex'
	],
	#category : #'EMM-OldSoundSystem'
}

{ #category : #'instance creation' }
StreamingMP3Sound class >> onFileNamed: fileName [
	"Answer an instance of me for playing the sound track of the MPEG or MP3 file with the given name. Answer nil the file is not a valid MPEG or MP3 file."

	| mpegFile |
	(MPEGFile isFileValidMPEG: fileName) ifFalse: [^ nil].
	mpegFile := MPEGFile openFile: fileName.
	^ self new initMPEGFile: mpegFile streamIndex: 0  "assume sound track is in stream 0"

]

{ #category : #'file ops' }
StreamingMP3Sound >> closeFile [
	"Close the MP3 or MPEG file."

	self pause.
	mpegFile ifNil: [^ self].
	mpegFile closeFile.
	mpegFile := nil.
	mixer := nil.

]

{ #category : #private }
StreamingMP3Sound >> createMixer [
	"Create a mixed sound consisting of sampled sounds with one sound buffer's worth of samples. The sound has the same sampling rate and number of channels as the MPEG or MP3 file."

	| channels pan snd |
	mpegFile ifNil: [^ self error: 'No MPEG or MP3 file'].
	channels := mpegFile audioChannels: mpegStreamIndex.
	streamSamplingRate := mpegFile audioSampleRate: mpegStreamIndex.
	mixer := MixedSound new.
	1 to: channels do: [:c |
		channels = 1
			ifTrue: [pan := 0.5]
			ifFalse: [pan := (c - 1) asFloat / (channels - 1)].
		snd := SampledSound
			samples: (SoundBuffer newMonoSampleCount: 2)  "buffer size will be adjusted dynamically"
			samplingRate: streamSamplingRate.
		mixer add: snd pan: pan volume: volume].

]

{ #category : #accessing }
StreamingMP3Sound >> duration [
	"Answer the duration of this sound in seconds."

	^ totalSamples asFloat / streamSamplingRate

]

{ #category : #initialization }
StreamingMP3Sound >> initMPEGFile: anMPEGFile streamIndex: anInteger [
	"Initialize for playing the given stream of the given MPEG or MP3 file."

	volume := 0.3.
	repeat := false.
	mpegFile := anMPEGFile.
	mpegStreamIndex := anInteger.
	totalSamples := mpegFile audioSamples: mpegStreamIndex.
	self reset.

]

{ #category : #private }
StreamingMP3Sound >> loadBuffersForSampleCount: count [
        "Load the sound buffers for all tracks with the next count
samples from the MPEG
file sound track."

        | snd buf |
        1 to: mixer sounds size do: [:i |
                snd := mixer sounds at: i.
                buf := snd samples.
                buf monoSampleCount = count ifFalse: [
                        buf := SoundBuffer newMonoSampleCount: count.
                        snd setSamples: buf samplingRate:
streamSamplingRate].
                i = 1 ifTrue: [  "first channel"
                                mpegFile
                                        audioReadBuffer: buf
                                        stream: mpegStreamIndex
                                        channel: 0]
                        ifFalse: [  "all other channels"
                                mpegFile
                                        audioReReadBuffer: buf
                                        stream: mpegStreamIndex
                                        channel: 1]].
        mixer reset.

]

{ #category : #playing }
StreamingMP3Sound >> millisecondsSinceStart [
	"Answer the number of milliseconds since this sound started playing."

	| i mSecs |
	mpegFile ifNil: [^ 0].
	mpegFile fileHandle ifNil: [^ 0].  "mpeg file not open"
	i := mpegFile audioGetSample: mpegStreamIndex.
	i < 0 ifTrue: [^ 0].  "movie file has no audio"
	mSecs := i * 1000 // streamSamplingRate.
	(self isPlaying and: [lastBufferMSecs > 0]) ifTrue: [
		"adjust mSecs by the milliseconds since the last buffer"
		mutex critical: [
			mSecs := i * 1000 // streamSamplingRate.
			mSecs := mSecs + ((Time millisecondClockValue - lastBufferMSecs) max: 0)]].
	^ mSecs + 350 - (2 * SoundPlayer bufferMSecs)

]

{ #category : #'file ops' }
StreamingMP3Sound >> mpegFileIsOpen [
	"Answer true if I have an open, valid MPEG file handle. If the handle is not valid, try to re-open the file."

	mpegFile ifNil: [^ false].
	mpegFile fileHandle ifNil: [
		"try to reopen the file, which may have been saved in a snapshot"
		mpegFile openFile: mpegFile fileName.
		mpegFile fileHandle ifNil: [mpegFile := nil]].
	^ mpegFile notNil

]

{ #category : #playing }
StreamingMP3Sound >> playSampleCount: n into: aSoundBuffer startingAt: startIndex [
	"Mix the next n samples of this sound into the given buffer starting at the given index"

	| current |
	self repeat ifTrue: [  "loop if necessary"
		current := mpegFile audioGetSample: mpegStreamIndex.
		(totalSamples - current) < n ifTrue: [
			mpegFile audioSetSample: 0 stream: mpegStreamIndex]].

	mutex critical: [
		lastBufferMSecs := Time millisecondClockValue.
		self loadBuffersForSampleCount: (n * streamSamplingRate) // SoundPlayer samplingRate.
		mixer playSampleCount: n into: aSoundBuffer startingAt: startIndex ].

]

{ #category : #accessing }
StreamingMP3Sound >> repeat [
	"Answer the repeat flag."

	repeat ifNil: [repeat := false].
	^ repeat

]

{ #category : #accessing }
StreamingMP3Sound >> repeat: aBoolean [
	"Set the repeat flag. If true, this sound will loop back to the beginning when it gets to the end."

	repeat := aBoolean.

]

{ #category : #playing }
StreamingMP3Sound >> reset [

	super reset.
	self createMixer.
	mpegFile audioSetSample: 0 stream: mpegStreamIndex.
	lastBufferMSecs := 0.
	mutex := Semaphore forMutualExclusion.

]

{ #category : #playing }
StreamingMP3Sound >> samplesRemaining [

	| samplesPlayed |
	mpegFile ifNil: [^ 0].
	self repeat ifTrue: [^ 1000000].
	samplesPlayed := mpegFile audioGetSample: mpegStreamIndex.
	samplesPlayed > totalSamples ifTrue: [^ 0].
	^ totalSamples - samplesPlayed

]

{ #category : #converting }
StreamingMP3Sound >> saveAsFileNamed: newFileName compressionType: compressionTypeString [
	"Store this MP3 sound in a SunAudio file with the given name using the given compression type."

	| outFile |
	outFile := (FileStream newFileNamed: newFileName) binary.
	self storeSunAudioOn: outFile compressionType: compressionTypeString.
	outFile close.

]

{ #category : #accessing }
StreamingMP3Sound >> soundPosition [
	"Answer the relative position of sound playback as a number between 0.0 and 1.0."

	self mpegFileIsOpen ifFalse: [^ 0.0].
	mpegFile hasAudio ifFalse: [^ 0.0].
	^ (mpegFile audioGetSample: 0) asFloat / totalSamples

]

{ #category : #accessing }
StreamingMP3Sound >> soundPosition: fraction [
	"Jump to the position the given fraction through the sound file. The argument is a number between 0.0 and 1.0."

	| sampleIndex |
	self mpegFileIsOpen ifFalse: [^ self].
	mpegFile hasAudio ifTrue: [
		sampleIndex := ((totalSamples * fraction) truncated max: 0) min: totalSamples.
		mpegFile audioSetSample: 0 stream: 0.  "work around for library bug: first seek to zero"
		mpegFile audioSetSample: sampleIndex stream: 0].

]

{ #category : #converting }
StreamingMP3Sound >> storeSunAudioOn: aBinaryStream compressionType: compressionName [
	"Store myself on the given stream as a monophonic sound compressed with the given type of compression. The sampling rate is reduced to 22050 samples/second if it is higher."

	| fmt inBufSize samplesPerFrame codec inBuf compressed outSamplingRate audioWriter samplesRemaining outBuf counts byteCount |
	self pause; reset.  "stop playing and return to beginning"

	fmt := SunAudioFileWriter formatCodeForCompressionType: compressionName.
	inBufSize := 64000.
	samplesPerFrame := 1.
	codec := SunAudioFileWriter codecForFormatCode: fmt.
	codec ifNotNil: [
		samplesPerFrame := codec samplesPerFrame.
		inBufSize := inBufSize roundUpTo: (2 * samplesPerFrame).
		compressed := ByteArray new:
			(inBufSize // samplesPerFrame) * codec bytesPerEncodedFrame].
	inBuf := SoundBuffer newMonoSampleCount: inBufSize.
	outSamplingRate := streamSamplingRate.
	streamSamplingRate > 22050 ifTrue: [
		streamSamplingRate = 44100 ifFalse: [self error: 'unexpected MP3 sampling rate'].
		outSamplingRate := 22050].

	"write audio header"
	audioWriter := SunAudioFileWriter onStream: aBinaryStream.
	audioWriter writeHeaderSamplingRate: outSamplingRate format: fmt.

	"convert and write sound data"
	'Storing audio...' displayProgressAt: Sensor cursorPoint
		from: 0 to: totalSamples during: [:bar |
			samplesRemaining := totalSamples.
			[samplesRemaining > 0] whileTrue: [
				bar value: totalSamples - samplesRemaining.
				samplesRemaining < inBuf monoSampleCount ifTrue: [
					inBuf := SoundBuffer newMonoSampleCount:
						(samplesRemaining roundUpTo: 2 * samplesPerFrame)].
				mpegFile audioReadBuffer: inBuf stream: 0 channel: 0.
				outSamplingRate < streamSamplingRate
					ifTrue: [outBuf := inBuf downSampledLowPassFiltering: true]
					ifFalse: [outBuf := inBuf].
				codec
					ifNil: [audioWriter appendSamples: outBuf]
					ifNotNil: [
						counts := codec
							encodeFrames: (outBuf size // samplesPerFrame)
							from: outBuf at: 1
							into: compressed at: 1.
						byteCount := counts last.
						byteCount = compressed size
							ifTrue: [audioWriter appendBytes: compressed]
							ifFalse: [audioWriter appendBytes: (compressed copyFrom: 1 to: byteCount)]].
				samplesRemaining := samplesRemaining - inBuf monoSampleCount]].

	"update audio header"
	audioWriter updateHeaderDataSize.

]

{ #category : #accessing }
StreamingMP3Sound >> streamSamplingRate [
	"Answer the sampling rate of the MP3 stream."

	^ streamSamplingRate

]

{ #category : #accessing }
StreamingMP3Sound >> volume [
	"Answer my volume."

	^ volume

]

{ #category : #accessing }
StreamingMP3Sound >> volume: aNumber [
	"Set my volume to the given number between 0.0 and 1.0."

	volume := aNumber.
	self createMixer.

]