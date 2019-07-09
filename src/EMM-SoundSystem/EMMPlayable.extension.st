Extension { #name : #EMMPlayable }

{ #category : #'*EMM-SoundSystem' }
EMMPlayable >> isPlaying [
	^ self streaming isPlaying
]

{ #category : #'*EMM-SoundSystem' }
EMMPlayable >> pause [
	self streaming pause
]

{ #category : #'*EMM-SoundSystem' }
EMMPlayable >> play [
	self streaming play
]

{ #category : #'*EMM-SoundSystem' }
EMMPlayable >> streaming [
	^ streaming ifNil: [ streaming := (StreamingMP3Sound onFileNamed: self path originalString) ]
]
