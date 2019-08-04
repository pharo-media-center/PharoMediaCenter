Class {
	#name : #EMMPath,
	#superclass : #Object,
	#instVars : [
		'path'
	],
	#category : #'EMM-MusicLibrary'
}

{ #category : #'instance creation' }
EMMPath class >> newWithPath: aPath [
	^ ((aPath beginsWith: 'http') ifTrue: [ EMMDistantPath new ] ifFalse: [ EMMLocalPath new ])
		path: aPath;
		yourself
]

{ #category : #accessing }
EMMPath >> createMediaWithVLC: vlc [
	^ self subclassResponsibility 
]

{ #category : #testing }
EMMPath >> isDistantPath [
	^ false
]

{ #category : #testing }
EMMPath >> isLocalPath [
	^ false
]

{ #category : #accessing }
EMMPath >> path [
	^ path
]

{ #category : #accessing }
EMMPath >> path: anObject [
	path := anObject
]
