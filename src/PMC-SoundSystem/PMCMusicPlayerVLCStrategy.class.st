Class {
	#name : #PMCMusicPlayerVLCStrategy,
	#superclass : #PMCMusicPlayerStrategy,
	#instVars : [
		'vlc',
		'vlcInstance',
		'vlcListPlayer',
		'mediaList'
	],
	#category : #'PMC-SoundSystem-MusicPlayer'
}

{ #category : #initialization }
PMCMusicPlayerVLCStrategy class >> initialize [
	"Required to reset the Initialized flag on image startup.
	Force libgit initialization since we just installed libgit.
	Otherwise this would cause a libgit crash"
	
	Smalltalk addToStartUpList: self.
]

{ #category : #initialization }
PMCMusicPlayerVLCStrategy class >> reset [
	<script>
	VLCLibrary reset.
	self allInstancesDo: #initialize
]

{ #category : #initialization }
PMCMusicPlayerVLCStrategy class >> startUp: isImageStarting [

	isImageStarting ifTrue: [ self reset ]
]

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> currentMedia [
	| mediaPlayer currentMedia |
	mediaPlayer := vlcListPlayer mediaPlayer.
	^ currentMedia := vlc getMediaInsideMediaPlayer: mediaPlayer.
]

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> currentPosition [
	| mediaPlayer |
	mediaPlayer := vlcListPlayer mediaPlayer.
	^ vlc positionMediaPlayer: mediaPlayer
]

{ #category : #initialization }
PMCMusicPlayerVLCStrategy >> initialize [
	super initialize.
	vlc := VLCLibrary uniqueInstance.
	self initializePlayerWithVideo: false
]

{ #category : #initialization }
PMCMusicPlayerVLCStrategy >> initializeEventNextMusic [
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

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> initializePlayerWithVideo: withVideoBoolean [
	VLCLibrary reset.
	withVideoBoolean
		ifTrue: [
			vlcInstance := vlc createVLCInstance ]
		ifFalse: [ | colArguments |
			colArguments := {'--no-video'}.
			vlcInstance := vlc createVLCWithArguments: colArguments ].
	vlcListPlayer := vlcInstance createMediaListPlayer
]

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> insert: aMedia atIndex: anIndex [
	| result |
	result := mediaList insertMedia: aMedia at: anIndex anIndex. "we do not do -1 because we want the next entry"
	result ~= 0 ifTrue: [ self error: 'Fail add media at the end of the list' ]
]

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> isPlaying [
	^ vlcListPlayer isPlaying
]

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> mediaForPlayable: aPlayable [
	^ aPlayable path createMediaWithVLC: vlc forInstance: vlcInstance
]

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> musicList: aListOfMedia [
	mediaList := vlcInstance createMediaList.
	aListOfMedia do: [ :aMedia | mediaList addMedia: aMedia ].
	vlcListPlayer mediaList: mediaList
]

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> nextSound [
	vlcListPlayer next
]

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> pause [
	vlcListPlayer pause
]

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> play [
	vlcListPlayer play
]

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> previousSound [
	vlcListPlayer previous
]

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> size [
	^ mediaList count
]

{ #category : #adding }
PMCMusicPlayerVLCStrategy >> stop [
	vlcListPlayer stop
]
