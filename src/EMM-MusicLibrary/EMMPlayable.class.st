Class {
	#name : #EMMPlayable,
	#superclass : #Object,
	#instVars : [
		'path',
		'name'
	],
	#category : #'EMM-MusicLibrary'
}

{ #category : #'instance creation' }
EMMPlayable class >> newWithName: aName stringPath: aPath [
	^ self new
		name: aName;
		stringPath: aPath;
		yourself
]

{ #category : #accessing }
EMMPlayable >> <= aPlayable [
	^ self name <= aPlayable name
]

{ #category : #accessing }
EMMPlayable >> name [
	^ name
]

{ #category : #accessing }
EMMPlayable >> name: anObject [
	name := anObject
]

{ #category : #accessing }
EMMPlayable >> path [
	^ path
]

{ #category : #accessing }
EMMPlayable >> path: anEMMPath [
	path := anEMMPath
]

{ #category : #accessing }
EMMPlayable >> stringPath: aStringPath [
	path := EMMPath newWithPath: aStringPath
]
