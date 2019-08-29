Class {
	#name : #PMCPath,
	#superclass : #Object,
	#instVars : [
		'path'
	],
	#category : #'PMC-MusicLibrary'
}

{ #category : #'instance creation' }
PMCPath class >> newWithPath: aPath [
	^ ((aPath beginsWith: 'http') ifTrue: [ PMCDistantPath new ] ifFalse: [ PMCLocalPath new ])
		path: aPath;
		yourself
]

{ #category : #'as yet unclassified' }
PMCPath >> createMediaWithVLC: vlc forInstance: anInstance [
	 ^ self subclassResponsibility
]

{ #category : #testing }
PMCPath >> isDistantPath [
	^ false
]

{ #category : #testing }
PMCPath >> isLocalPath [
	^ false
]

{ #category : #accessing }
PMCPath >> path [
	^ path
]

{ #category : #accessing }
PMCPath >> path: anObject [
	path := anObject
]
