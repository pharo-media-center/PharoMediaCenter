Class {
	#name : #PMCPlayable,
	#superclass : #Object,
	#instVars : [
		'path',
		'name'
	],
	#category : #'PMC-MusicLibrary'
}

{ #category : #'instance creation' }
PMCPlayable class >> newWithName: aName stringPath: aPath [
	^ self new
		name: aName;
		stringPath: aPath;
		yourself
]

{ #category : #accessing }
PMCPlayable >> <= aPlayable [
	^ self name <= aPlayable name
]

{ #category : #accessing }
PMCPlayable >> name [
	^ name
]

{ #category : #accessing }
PMCPlayable >> name: anObject [
	name := anObject
]

{ #category : #accessing }
PMCPlayable >> path [
	^ path
]

{ #category : #accessing }
PMCPlayable >> path: anEMMPath [
	path := anEMMPath
]

{ #category : #accessing }
PMCPlayable >> stringPath: aStringPath [
	path := PMCPath newWithPath: aStringPath
]
