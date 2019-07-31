Class {
	#name : #EMMMPlaylist,
	#superclass : #Object,
	#instVars : [
		'songs',
		'name'
	],
	#category : #'EMM-MusicLibrary'
}

{ #category : #comparing }
EMMMPlaylist >> <= anEMMMPlaylist [
	^ self name < anEMMMPlaylist name
]

{ #category : #comparing }
EMMMPlaylist >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #accessing }
EMMMPlaylist >> addSong: anEMMSong [
	songs add: anEMMSong
]

{ #category : #comparing }
EMMMPlaylist >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash
]

{ #category : #accessing }
EMMMPlaylist >> initialize [
	songs := OrderedCollection new
]

{ #category : #accessing }
EMMMPlaylist >> name [
	^ name
]

{ #category : #accessing }
EMMMPlaylist >> name: anObject [
	name := anObject
]

{ #category : #accessing }
EMMMPlaylist >> songs [
	^ songs
]

{ #category : #accessing }
EMMMPlaylist >> songs: anObject [
	songs := anObject
]
