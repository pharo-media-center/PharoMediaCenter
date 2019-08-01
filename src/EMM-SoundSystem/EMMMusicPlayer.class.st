"
This player is a lot inspired by the QueueSound

But it allows us to keep information of the previous sounds
"
Class {
	#name : #EMMMusicPlayer,
	#superclass : #Object,
	#instVars : [
		'vlc',
		'vlcListPlayer',
		'playableToMedia',
		'currentPlayable',
		'vlcEventManager',
		'setCurrentPlayable',
		'mediaList'
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

{ #category : #accessing }
EMMMusicPlayer >> add: aPlayable [
	self addAtTheEnd: aPlayable
]

{ #category : #accessing }
EMMMusicPlayer >> addAtTheBeginning: aPlayable [
	| media |
	media := self mediaForPlayable: aPlayable.
	self flag: #todo
]

{ #category : #accessing }
EMMMusicPlayer >> addAtTheEnd: aPlayable [
	| media |
	media := self mediaForPlayable: aPlayable.
	self flag: #todo
]

{ #category : #accessing }
EMMMusicPlayer >> currentPlayable [
	^ currentPlayable
]

{ #category : #initialization }
EMMMusicPlayer >> initialize [
	super initialize.
	vlc := VLCLibrary uniqueInstance.
	vlcListPlayer := vlc createListPlayer.
	vlcEventManager := vlc eventManagerListPlayer: vlcListPlayer.
	playableToMedia := OrderedDictionary new.
	self initializeEvents	
]

{ #category : #initialization }
EMMMusicPlayer >> initializeEvents [
	| result |
	"keep setCurrentPlayable in instance var because the gargabe collec must not collect it"
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
	result ~= 0 ifTrue: [ self error: 'Event Manager not correctly set' ]
]

{ #category : #accessing }
EMMMusicPlayer >> isPlaying [
	^ vlc isListPlayerPlaying: vlcListPlayer
]

{ #category : #private }
EMMMusicPlayer >> mediaForPlayable: aPlayable [
	^ playableToMedia at: aPlayable ifAbsentPut: [ vlc mediaFileFromStringPath: aPlayable path originalString ]
]

{ #category : #accessing }
EMMMusicPlayer >> musicList [
	^ playableToMedia keys
]

{ #category : #accessing }
EMMMusicPlayer >> musicList: aListOfPlayable [
	self resetList.
	mediaList := vlc createMediaList.
	aListOfPlayable collect: [ :aPlayable | self mediaForPlayable: aPlayable ] thenDo: [ :aMedia | vlc addMedia: aMedia inMediaList: mediaList ].
	self pause.
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
