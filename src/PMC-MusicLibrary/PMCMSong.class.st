Class {
	#name : #PMCMSong,
	#superclass : #PMCPlayable,
	#instVars : [
		'folder',
		'artists',
		'title',
		'track',
		'length'
	],
	#category : #'PMC-MusicLibrary'
}

{ #category : #accessing }
PMCMSong >> artists [
	^ artists
]

{ #category : #accessing }
PMCMSong >> artists: anObject [
	artists := anObject
]

{ #category : #accessing }
PMCMSong >> folder [
	^ folder
]

{ #category : #accessing }
PMCMSong >> folder: anObject [
	folder := anObject
]

{ #category : #accessing }
PMCMSong >> initialize [
	super initialize.
	artists := Set new
]

{ #category : #accessing }
PMCMSong >> length [
	^ length
]

{ #category : #accessing }
PMCMSong >> length: anObject [
	length := anObject
]

{ #category : #printing }
PMCMSong >> printOn: aStream [
	aStream nextPutAll: self name
]

{ #category : #accessing }
PMCMSong >> title [
	^ title
]

{ #category : #accessing }
PMCMSong >> title: anObject [
	title := anObject
]

{ #category : #accessing }
PMCMSong >> track [
	^ track
]

{ #category : #accessing }
PMCMSong >> track: anObject [
	track := anObject
]
