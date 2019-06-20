Class {
	#name : #EMMMSong,
	#superclass : #EMMPlayable,
	#instVars : [
		'folder',
		'name',
		'artists',
		'title',
		'track',
		'length'
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
EMMMSong >> length [
	^ length
]

{ #category : #accessing }
EMMMSong >> length: anObject [
	length := anObject
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

{ #category : #accessing }
EMMMSong >> title [
	^ title
]

{ #category : #accessing }
EMMMSong >> title: anObject [
	title := anObject
]

{ #category : #accessing }
EMMMSong >> track [
	^ track
]

{ #category : #accessing }
EMMMSong >> track: anObject [
	track := anObject
]
