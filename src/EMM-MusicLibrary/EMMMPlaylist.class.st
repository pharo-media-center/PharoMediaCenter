Class {
	#name : #EMMMPlaylist,
	#superclass : #EMMMWithPlayable,
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

{ #category : #comparing }
EMMMPlaylist >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash
]

{ #category : #accessing }
EMMMPlaylist >> initialize [
	songs := OrderedCollection new
]
