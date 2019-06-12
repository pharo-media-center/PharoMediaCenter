Class {
	#name : #EMMMArtist,
	#superclass : #Object,
	#instVars : [
		'songs',
		'name'
	],
	#category : #EMM
}

{ #category : #comparing }
EMMMArtist >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #accessing }
EMMMArtist >> addSong: anEMMSong [
	songs add: anEMMSong
]

{ #category : #comparing }
EMMMArtist >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash
]

{ #category : #accessing }
EMMMArtist >> initialize [
	songs := Set new
]

{ #category : #accessing }
EMMMArtist >> name [
	^ name
]

{ #category : #accessing }
EMMMArtist >> name: anObject [
	name := anObject
]

{ #category : #accessing }
EMMMArtist >> songs [
	^ songs
]

{ #category : #accessing }
EMMMArtist >> songs: anObject [
	songs := anObject
]
