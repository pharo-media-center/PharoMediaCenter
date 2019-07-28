"
This player is a lot inspired by the QueueSound

But it allows us to keep information of the previous sounds
"
Class {
	#name : #EMMMusicPlayer,
	#superclass : #Object,
	#instVars : [
		'musicList',
		'vlc',
		'vlcListPlayer'
	],
	#category : #'EMM-SoundSystem'
}

{ #category : #accessing }
EMMMusicPlayer >> add: aPlayable [
	self addAtTheEnd: aPlayable
]

{ #category : #accessing }
EMMMusicPlayer >> addAtTheBeginning: aPlayable [
	musicList addFirst: aPlayable
]

{ #category : #accessing }
EMMMusicPlayer >> addAtTheEnd: aPlayable [
	musicList addLast: aPlayable
]

{ #category : #accessing }
EMMMusicPlayer >> currentMusic [
	^ (self musicList at: (self pointerCurrentMusic) ifAbsent: [ ^ nil ])
]

{ #category : #accessing }
EMMMusicPlayer >> currentSound [ 
	^ self currentMusic ifNil: [ ^ nil ] ifNotNil: [ :playable | playable streaming ]
]

{ #category : #initialization }
EMMMusicPlayer >> initialize [
	super initialize.
	musicList := OrderedCollection new.
	vlc := VLCLibrary uniqueInstance.
	vlcListPlayer := vlc createListPlayer.
	
]

{ #category : #accessing }
EMMMusicPlayer >> musicList [
	^ musicList
]

{ #category : #accessing }
EMMMusicPlayer >> musicList: aListOfPlayable [
	| mediaList |
	self flag: #ImproveWithFFICallThatSetTheListInOneTime.
	mediaList := vlc createMediaList.
	aListOfPlayable collect: [ :aPlayable | vlc mediaFileFromStringPath: aPlayable path asString ] thenDo: [ :aMedia | vlc addMedia: aMedia inMediaList: mediaList ].
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
