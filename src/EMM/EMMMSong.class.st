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
	| id3parser |
	"Minimal initialization"
	self name: aFileReference basenameWithoutExtension.
	"Try to parse ID3 metadata for MP3 files"
	id3parser := ID3Parser on: (File named: aFileReference originalString) readStream.
	id3parser id3v2Tag
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
