Class {
	#name : #EMMPlayable,
	#superclass : #Object,
	#instVars : [
		'path',
		'streaming'
	],
	#category : #'EMM-MusicLibrary'
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