"
This player allows one to use VLC to play playable in the computer (not in the pharo image).
It rely on the strategy to use vlc and keep abstract information at this level.
"
Class {
	#name : #PMCMusicPlayer,
	#superclass : #Object,
	#instVars : [
		'playerStrategy',
		'playableToMedia',
		'currentPlayable'
	],
	#category : #'PMC-SoundSystem-MusicPlayer'
}

{ #category : #initialization }
PMCMusicPlayer class >> withVideo: withVideo [
	^ self new initializeVLCWithVideo: withVideo
]

{ #category : #adding }
PMCMusicPlayer >> add: aPlayable [
	self addAtTheEnd: aPlayable
]

{ #category : #adding }
PMCMusicPlayer >> addAtTheEnd: aPlayable [
	| media |
	media := self createAndAddMediaForPlayable: aPlayable.
	self playerStrategy addAtTheEnd: media
]

{ #category : #adding }
PMCMusicPlayer >> addNext: aPlayable [
	| media index |
	media := self mediaForPlayable: aPlayable.
	index := self currentPlayablePosition.
	playableToMedia add: (aPlayable -> media) afterIndex: index.
	self playerStrategy addNext: media.
]

{ #category : #private }
PMCMusicPlayer >> createAndAddMediaForPlayable: aPlayable [
	^ (playableToMedia add: aPlayable -> (self mediaForPlayable: aPlayable)) value
]

{ #category : #accessing }
PMCMusicPlayer >> currentPlayable [
	| currentMedia |
	currentMedia := self playerStrategy currentMedia.
	^ (playableToMedia select: [ :assoc | assoc value getHandle = currentMedia getHandle ]) ifNotEmpty: [ :assocCollection | assocCollection first key ] ifEmpty: [ nil ]
]

{ #category : #accessing }
PMCMusicPlayer >> currentPlayablePosition [
	| currentMedia |
	currentMedia := self playerStrategy currentMedia.
	playableToMedia doWithIndex: [ :el :index | el value getHandle = currentMedia getHandle ifTrue: [ ^ index ] ].
	^ 0
]

{ #category : #accessing }
PMCMusicPlayer >> currentPosition [
	^ self playerStrategy currentPosition
]

{ #category : #initialization }
PMCMusicPlayer >> defaultPlayerStrategy [
	^ PMCMusicPlayerVLCStrategy
]

{ #category : #initialization }
PMCMusicPlayer >> initialize [
	super initialize.
	playableToMedia := OrderedCollection new.
	self playerStrategy: self defaultPlayerStrategy new.
	self playerStrategy initializePlayerWithVideo: false.
]

{ #category : #adding }
PMCMusicPlayer >> initializeVLCWithVideo: aBoolean [
	self playerStrategy initializePlayerWithVideo: aBoolean
]

{ #category : #accessing }
PMCMusicPlayer >> isPlaying [
	^ self playerStrategy isPlaying
]

{ #category : #private }
PMCMusicPlayer >> mediaForPlayable: aPlayable [
	^ self playerStrategy mediaForPlayable: aPlayable
]

{ #category : #accessing }
PMCMusicPlayer >> musicList [
	^ playableToMedia collect: #key
]

{ #category : #adding }
PMCMusicPlayer >> musicList: aListOfPlayable [
	self resetList.
	self stop.
	self playerStrategy musicList: (aListOfPlayable collect: [ :aPlayable | self createAndAddMediaForPlayable: aPlayable ]).
	self play
]

{ #category : #control }
PMCMusicPlayer >> nextSound [
	self playerStrategy nextSound
]

{ #category : #control }
PMCMusicPlayer >> pause [
	self playerStrategy pause
]

{ #category : #control }
PMCMusicPlayer >> play [
	self playerStrategy play
]

{ #category : #accessing }
PMCMusicPlayer >> playerStrategy [
	^ playerStrategy
]

{ #category : #accessing }
PMCMusicPlayer >> playerStrategy: anObject [
	playerStrategy := anObject
]

{ #category : #control }
PMCMusicPlayer >> previousSound [
	self playerStrategy previousSound
]

{ #category : #initialization }
PMCMusicPlayer >> reset [
	self class reset.
	self initialize
]

{ #category : #private }
PMCMusicPlayer >> resetList [
	playableToMedia removeAll
]

{ #category : #adding }
PMCMusicPlayer >> stop [
	self playerStrategy stop
]
