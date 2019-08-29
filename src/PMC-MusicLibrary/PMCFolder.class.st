Class {
	#name : #PMCFolder,
	#superclass : #PMCWithPlayable,
	#instVars : [
		'parentFolder'
	],
	#category : #'PMC-MusicLibrary'
}

{ #category : #'instance creation' }
PMCFolder class >> newFromFileReference: aFileReference [
	^ self new initializationFromFile: aFileReference
]

{ #category : #comparing }
PMCFolder >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ parentFolder = anObject parentFolder and: [ name = anObject name ]
]

{ #category : #comparing }
PMCFolder >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ parentFolder hash bitXor: name hash
]

{ #category : #initialization }
PMCFolder >> initializationFromFile: aFileReference [
	name := aFileReference basename
]

{ #category : #initialization }
PMCFolder >> initialize [ 
	songs := SortedCollection new
]

{ #category : #accessing }
PMCFolder >> parentFolder [
	^ parentFolder
]

{ #category : #accessing }
PMCFolder >> parentFolder: anObject [
	parentFolder := anObject
]
