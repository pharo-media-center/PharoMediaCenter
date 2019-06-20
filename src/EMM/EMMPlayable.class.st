Class {
	#name : #EMMPlayable,
	#superclass : #Object,
	#instVars : [
		'path'
	],
	#category : #EMM
}

{ #category : #testing }
EMMPlayable class >> isAbstract [
	^ self == EMMPlayable 
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
EMMPlayable >> play [
	(StreamingMP3Sound onFileNamed: self path originalString) play
]
