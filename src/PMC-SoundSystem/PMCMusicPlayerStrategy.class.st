"
A playable comes is the abstract entity that can be used to create a media.
The media is real entity that will be played.

A playable can be a media with some sound system.
With vlc, a media refers to a c struct.
"
Class {
	#name : #PMCMusicPlayerStrategy,
	#superclass : #Object,
	#category : #'PMC-SoundSystem-MusicPlayer'
}

{ #category : #testing }
PMCMusicPlayerStrategy class >> isAbstract [
	^ self == PMCMusicPlayerStrategy
]

{ #category : #adding }
PMCMusicPlayerStrategy >> addAtTheEnd: aMedia [
	^ self insert: aMedia atIndex: self size
]

{ #category : #adding }
PMCMusicPlayerStrategy >> addNext: aMedia [
	^ self insert: aMedia atIndex: self currentPosition + 1
]

{ #category : #adding }
PMCMusicPlayerStrategy >> currentMedia [
	^ self subclassResponsibility
]

{ #category : #adding }
PMCMusicPlayerStrategy >> currentPosition [
	^ self subclassResponsibility
]

{ #category : #adding }
PMCMusicPlayerStrategy >> initializePlayerWithVideo: aBoolean [
	"should raise an error if do not support the video and the boolean is true"
	^ self subclassResponsibility 
]

{ #category : #adding }
PMCMusicPlayerStrategy >> insert: aMedia atIndex: anIndex [
	^ self subclassResponsibility
]

{ #category : #adding }
PMCMusicPlayerStrategy >> isPlaying [
	^ self subclassResponsibility
]

{ #category : #adding }
PMCMusicPlayerStrategy >> mediaForPlayable: aPlayable [
	^ self subclassResponsibility
]

{ #category : #adding }
PMCMusicPlayerStrategy >> musicList: aListOfMedia [
	self subclassResponsibility 
]

{ #category : #adding }
PMCMusicPlayerStrategy >> nextSound [
	^ self subclassResponsibility
]

{ #category : #adding }
PMCMusicPlayerStrategy >> pause [
	^ self subclassResponsibility
]

{ #category : #adding }
PMCMusicPlayerStrategy >> play [
	^ self subclassResponsibility
]

{ #category : #adding }
PMCMusicPlayerStrategy >> previousSound [
	^ self subclassResponsibility
]

{ #category : #adding }
PMCMusicPlayerStrategy >> size [
	^ self subclassResponsibility
]

{ #category : #adding }
PMCMusicPlayerStrategy >> stop [
	^ self subclassResponsibility
]
