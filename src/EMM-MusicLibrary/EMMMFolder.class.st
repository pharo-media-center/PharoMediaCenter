Class {
	#name : #EMMMFolder,
	#superclass : #Object,
	#instVars : [
		'parentFolder',
		'name',
		'songs'
	],
	#category : #'EMM-MusicLibrary'
}

{ #category : #'instance creation' }
EMMMFolder class >> newFromFileReference: aFileReference [
	^ self new initializationFromFile: aFileReference
]

{ #category : #comparing }
EMMMFolder >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ parentFolder = anObject parentFolder and: [ name = anObject name ]
]

{ #category : #accessing }
EMMMFolder >> addSong: anEMMMSong [
	^ songs add: anEMMMSong
]

{ #category : #comparing }
EMMMFolder >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ parentFolder hash bitXor: name hash
]

{ #category : #initialization }
EMMMFolder >> initializationFromFile: aFileReference [
	name := aFileReference basename
]

{ #category : #initialization }
EMMMFolder >> initialize [ 
	songs := Set new
]

{ #category : #accessing }
EMMMFolder >> name [
	^ name
]

{ #category : #accessing }
EMMMFolder >> name: anObject [
	name := anObject
]

{ #category : #accessing }
EMMMFolder >> parentFolder [
	^ parentFolder
]

{ #category : #accessing }
EMMMFolder >> parentFolder: anObject [
	parentFolder := anObject
]

{ #category : #accessing }
EMMMFolder >> songs [
	^ songs
]

{ #category : #accessing }
EMMMFolder >> songs: anObject [
	songs := anObject
]
