Class {
	#name : #EMMMSong,
	#superclass : #Object,
	#instVars : [
		'folder',
		'name'
	],
	#category : #EMM
}

{ #category : #'instance creation' }
EMMMSong class >> newFromFile: aFileReference [
	^ self new initializationFromFile: aFileReference
]

{ #category : #accessing }
EMMMSong >> initializationFromFile: aFileReference [
	self name: aFileReference basenameWithoutExtension
]

{ #category : #accessing }
EMMMSong >> name [
	^ name
]

{ #category : #accessing }
EMMMSong >> name: anObject [
	name := anObject
]

{ #category : #printing }
EMMMSong >> printOn: aStream [
	aStream nextPutAll: self name
]
