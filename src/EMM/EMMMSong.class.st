Class {
	#name : #EMMMSong,
	#superclass : #Object,
	#instVars : [
		'folder',
		'name',
		'artists'
	],
	#category : #EMM
}

{ #category : #accessing }
EMMMSong >> artists [
	^ artists
]

{ #category : #accessing }
EMMMSong >> artists: anObject [
	artists := anObject
]

{ #category : #accessing }
EMMMSong >> folder [
	^ folder
]

{ #category : #accessing }
EMMMSong >> folder: anObject [
	folder := anObject
]

{ #category : #accessing }
EMMMSong >> initialize [
	super initialize.
	artists := Set new
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
