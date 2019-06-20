Class {
	#name : #EMMPlayable,
	#superclass : #Object,
	#instVars : [
		'path',
		'streaming'
	],
	#category : #EMM
}

{ #category : #testing }
EMMPlayable class >> isAbstract [
	^ self == EMMPlayable 
]

{ #category : #playing }
EMMPlayable >> isPlaying [
	^ self streaming isPlaying
]

{ #category : #accessing }
EMMPlayable >> path [
	^ path
]

{ #category : #accessing }
EMMPlayable >> path: anObject [
	path := anObject
]

{ #category : #playing }
EMMPlayable >> pause [
	self streaming pause
]

{ #category : #playing }
EMMPlayable >> play [
	self streaming play
]

{ #category : #playing }
EMMPlayable >> streaming [
	^ streaming ifNil: [ streaming := (StreamingMP3Sound onFileNamed: self path originalString) ]
]
