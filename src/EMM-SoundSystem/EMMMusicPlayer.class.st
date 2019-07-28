"
This player is a lot inspired by the QueueSound

But it allows us to keep information of the previous sounds
"
Class {
	#name : #EMMMusicPlayer,
	#superclass : #Object,
	#instVars : [
		'musicList',
		'pointerCurrentMusic',
		'done',
		'startTime',
		'vlc'
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
	pointerCurrentMusic := 1.
	vlc := VLCLibrary uniqueInstance.
]

{ #category : #accessing }
EMMMusicPlayer >> musicList [
	^ musicList
]

{ #category : #accessing }
EMMMusicPlayer >> musicList: aListOfPlayable [
	"set the new list of music and play the musics from the first one"
	musicList := aListOfPlayable.
	pointerCurrentMusic := 1.
	(musicList at: 1) streaming reset. 
	self reset.
	self play
]

{ #category : #control }
EMMMusicPlayer >> nextSound [
	| answer |
	pointerCurrentMusic := pointerCurrentMusic + 1.
	answer := (musicList at: pointerCurrentMusic ifAbsent: [ ^ nil ]) streaming.
	answer reset.
	^ answer
]

{ #category : #accessing }
EMMMusicPlayer >> pointerCurrentMusic [
	^ pointerCurrentMusic 
]

{ #category : #accessing }
EMMMusicPlayer >> pointerCurrentMusic: position [
	self currentSound ifNotNil: [ :currentSound | currentSound reset ].
	pointerCurrentMusic := position
	
]

{ #category : #control }
EMMMusicPlayer >> previousSound [
	| answer |
	pointerCurrentMusic := pointerCurrentMusic - 1.
	answer := (musicList at: pointerCurrentMusic ifAbsent: [ ^ nil ]) streaming.
	answer reset.
	^ answer
]
