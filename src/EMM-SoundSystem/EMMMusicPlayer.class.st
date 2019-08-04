"
This player is a lot inspired by the QueueSound

But it allows us to keep information of the previous sounds
"
Class {
	#name : #EMMMusicPlayer,
	#superclass : #Object,
	#instVars : [
		'vlc',
		'vlcInstance',
		'vlcListPlayer',
		'playableToMedia',
		'currentPlayable',
		'vlcEventManager',
		'mediaList',
		'result'
	],
	#category : #'EMM-SoundSystem-MusicPlayer'
}

{ #category : #initialization }
EMMMusicPlayer class >> initialize [
	"Required to reset the Initialized flag on image startup.
	Force libgit initialization since we just installed libgit.
	Otherwise this would cause a libgit crash"
	
	Smalltalk addToStartUpList: self.
]

{ #category : #initialization }
EMMMusicPlayer class >> reset [
	<script>
	VLCLibrary reset.
	self allInstancesDo: #initialize
]

{ #category : #initialization }
EMMMusicPlayer class >> startUp: isImageStarting [

	isImageStarting ifTrue: [ self reset ]
]

{ #category : #initialization }
EMMMusicPlayer class >> withVideo: withVideo [
	^ self new initializeVLCWithVideo: withVideo
]

{ #category : #adding }
EMMMusicPlayer >> add: aPlayable [
	self addAtTheEnd: aPlayable
]

{ #category : #adding }
EMMMusicPlayer >> addAtTheEnd: aPlayable [
	| media |
	media := self createAndAddMediaForPlayable: aPlayable.
	result := vlc insertInMediaList: mediaList media: media atIndex: playableToMedia size - 1.
	result ~= 0 ifTrue: [ self error: 'Fail add media at the end of the list' ]
]

{ #category : #adding }
EMMMusicPlayer >> addNext: aPlayable [
	| media index |
	media := self mediaForPlayable: aPlayable.
	index := self currentPlayablePosition.
	playableToMedia add: (aPlayable -> media) afterIndex: index.
	result := vlc insertInMediaList: mediaList media: media atIndex: index. "we do not do -1 because we want the next entry"
	result ~= 0 ifTrue: [ self error: 'Fail add media at the end of the list' ]
]

{ #category : #private }
EMMMusicPlayer >> createAndAddMediaForPlayable: aPlayable [
	^ (playableToMedia add: aPlayable -> (self mediaForPlayable: aPlayable)) value
]

{ #category : #accessing }
EMMMusicPlayer >> currentPlayable [
	| mediaPlayer |
	mediaPlayer := (vlc getCurrentMediaPlayerOfListPlayer: vlcListPlayer).
	^ (playableToMedia select: [ :assoc | assoc value getHandle = (vlc getMediaInsideMediaPlayer: mediaPlayer) getHandle ]) ifNotEmpty: [ :assocCollection | assocCollection first key ] ifEmpty: [ nil ]
]

{ #category : #accessing }
EMMMusicPlayer >> currentPlayablePosition [
	| mediaPlayer currentMedia |
	mediaPlayer := vlc getCurrentMediaPlayerOfListPlayer: vlcListPlayer.
	currentMedia := vlc getMediaInsideMediaPlayer: mediaPlayer.
	playableToMedia doWithIndex: [ :el :index | el value getHandle = currentMedia getHandle ifTrue: [ ^ index ] ].
	^ 0
]

{ #category : #accessing }
EMMMusicPlayer >> currentPosition [
	| mediaPlayer |
	mediaPlayer := vlc getCurrentMediaPlayerOfListPlayer: vlcListPlayer.
	^ vlc positionMediaPlayer: mediaPlayer
]

{ #category : #initialization }
EMMMusicPlayer >> initialize [
	super initialize.
	vlc := VLCLibrary uniqueInstance.
	self initializeVLCWithVideo: false.
	self initializeEvents	
]

{ #category : #initialization }
EMMMusicPlayer >> initializeEventNextMusic [
	"not use, but we keep the code cause it was cool"

"	| result |
	setCurrentPlayable := VLCEventCallback
		on: [ :event :data | 
			| vlcEvent |
			vlcEvent := VLCEvent_t fromHandle: event.
			currentPlayable := (playableToMedia associationsSelect: [ :assoc | assoc value getHandle = vlcEvent u vlcmpmc new_media getHandle ])
				ifNotEmpty: [ :assocCollection | assocCollection keyAtIndex: 1 ]
				ifEmpty: [ nil ] ].
	result := vlc
		attachToEventManager: vlcEventManager
		forEvent: VLCEventTypeEnumeration libvlc_MediaListPlayerNextItemSet
		withCallback: setCurrentPlayable
		andData: 0.0.
	result ~= 0 ifTrue: [ self error: 'Event Manager not correctly set' ]"
]

{ #category : #initialization }
EMMMusicPlayer >> initializeEvents [
	
]

{ #category : #initialization }
EMMMusicPlayer >> initializeVLCWithVideo: withVideoBoolean [
	VLCLibrary reset.
	withVideoBoolean
		ifTrue: [
			vlcInstance := vlc createVLCInstance ]
		ifFalse: [ | colArguments |
			colArguments := {'--no-video'}.
			vlcInstance := vlc createVLCWithArguments: colArguments ].
	vlcListPlayer := vlc createListPlayerForInstance: vlcInstance.
	vlcEventManager := vlc eventManagerListPlayer: vlcListPlayer.
	playableToMedia := OrderedCollection new.
	self initializeEvents
]

{ #category : #accessing }
EMMMusicPlayer >> isPlaying [
	^ vlc isListPlayerPlaying: vlcListPlayer
]

{ #category : #private }
EMMMusicPlayer >> mediaForPlayable: aPlayable [
	^ aPlayable path createMediaWithVLC: vlc forInstance: vlcInstance
]

{ #category : #accessing }
EMMMusicPlayer >> musicList [
	^ playableToMedia collect: #key
]

{ #category : #adding }
EMMMusicPlayer >> musicList: aListOfPlayable [
	self resetList.
	mediaList := vlc createMediaListFromInstance: vlcInstance.
	aListOfPlayable collect: [ :aPlayable | self createAndAddMediaForPlayable: aPlayable ] thenDo: [ :aMedia | vlc addMedia: aMedia inMediaList: mediaList ].
	vlc setMediaList: mediaList forListPlayer: vlcListPlayer.
	self play
]

{ #category : #control }
EMMMusicPlayer >> nextSound [
	vlc nextListPlayer: vlcListPlayer
]

{ #category : #control }
EMMMusicPlayer >> pause [
	vlc pauseListPlayer: vlcListPlayer 
]

{ #category : #control }
EMMMusicPlayer >> play [
	vlc playListPlayer: vlcListPlayer 
]

{ #category : #control }
EMMMusicPlayer >> previousSound [
	vlc previousListPlayer: vlcListPlayer
]

{ #category : #initialization }
EMMMusicPlayer >> reset [
	self class reset.
	self initialize
]

{ #category : #private }
EMMMusicPlayer >> resetList [
	playableToMedia removeAll
]
