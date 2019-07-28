Class {
	#name : #EMMMusicPlayerOld,
	#superclass : #Object,
	#instVars : [
		'musicList',
		'pointerCurrentMusic',
		'done',
		'startTime'
	],
	#category : #'EMM-OldSoundSystem'
}

{ #category : #accessing }
EMMMusicPlayerOld >> add: aPlayable [
	self addAtTheEnd: aPlayable
]

{ #category : #accessing }
EMMMusicPlayerOld >> addAtTheBeginning: aPlayable [
	musicList addFirst: aPlayable
]

{ #category : #accessing }
EMMMusicPlayerOld >> addAtTheEnd: aPlayable [
	musicList addLast: aPlayable
]

{ #category : #accessing }
EMMMusicPlayerOld >> currentMusic [
	^ (self musicList at: (self pointerCurrentMusic) ifAbsent: [ ^ nil ])
]

{ #category : #accessing }
EMMMusicPlayerOld >> currentSound [ 
	^ self currentMusic ifNil: [ ^ nil ] ifNotNil: [ :playable | playable streaming ]
]

{ #category : #'sound generation' }
EMMMusicPlayerOld >> doControl [
	super doControl.
	self currentSound notNil ifTrue: [self currentSound doControl]
]

{ #category : #accessing }
EMMMusicPlayerOld >> done: aBoolean [
	done := aBoolean
]

{ #category : #initialization }
EMMMusicPlayerOld >> initialize [
	super initialize.
	musicList := OrderedCollection new.
	done := false.
	startTime := Time millisecondClockValue.
	pointerCurrentMusic := 1.
]

{ #category : #'sound generation' }
EMMMusicPlayerOld >> mixSampleCount: n into: aSoundBuffer startingAt: startIndex leftVol: leftVol rightVol: rightVol [
	"Play a collection of sounds in sequence."

	| finalIndex i remaining count rate |
	self currentSound isNil ifTrue: [^ self].  "already done"
	self startTime > Time millisecondClockValue ifTrue: [^ self].
	rate := self samplingRate.
	finalIndex := (startIndex + n) - 1.
	i := startIndex.
	[i <= finalIndex] whileTrue: [
		[self currentSound isNil ifTrue: [^ self].
		(remaining := self currentSound samplesRemaining) <= 0]
			whileTrue: [self nextSound].
		count := (finalIndex - i) + 1.
		remaining < count ifTrue: [count := remaining].
		self currentSound playSampleCount: count into: aSoundBuffer startingAt: i "leftVol: leftVol rightVol: rightVol".
		i := i + count]
]

{ #category : #accessing }
EMMMusicPlayerOld >> musicList [
	^ musicList
]

{ #category : #accessing }
EMMMusicPlayerOld >> musicList: aListOfPlayable [
	"set the new list of music and play the musics from the first one"
	musicList := aListOfPlayable.
	pointerCurrentMusic := 1.
	(musicList at: 1) streaming reset. 
	self reset.
	self play
]

{ #category : #control }
EMMMusicPlayerOld >> nextSound [
	| answer |
	pointerCurrentMusic := pointerCurrentMusic + 1.
	answer := (musicList at: pointerCurrentMusic ifAbsent: [ ^ nil ]) streaming.
	answer reset.
	^ answer
]

{ #category : #accessing }
EMMMusicPlayerOld >> pointerCurrentMusic [
	^ pointerCurrentMusic 
]

{ #category : #accessing }
EMMMusicPlayerOld >> pointerCurrentMusic: position [
	self currentSound ifNotNil: [ :currentSound | currentSound reset ].
	pointerCurrentMusic := position
	
]

{ #category : #control }
EMMMusicPlayerOld >> previousSound [
	| answer |
	pointerCurrentMusic := pointerCurrentMusic - 1.
	answer := (musicList at: pointerCurrentMusic ifAbsent: [ ^ nil ]) streaming.
	answer reset.
	^ answer
]

{ #category : #'sound generation' }
EMMMusicPlayerOld >> samplesRemaining [
	(done and: [self musicList isEmpty])
		ifTrue: [^ 0]
		ifFalse: [^ 1000000].

]

{ #category : #accessing }
EMMMusicPlayerOld >> startTime [
	^ startTime
]

{ #category : #accessing }
EMMMusicPlayerOld >> startTime: anObject [
	startTime := anObject
]
