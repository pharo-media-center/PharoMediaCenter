Class {
	#name : #EMMPlayable,
	#superclass : #Object,
	#instVars : [
		'path'
	],
	#category : #'EMM-MusicLibrary'
}

{ #category : #accessing }
EMMPlayable >> path [
	^ path
]

{ #category : #accessing }
EMMPlayable >> path: anObject [
	path := anObject
]
