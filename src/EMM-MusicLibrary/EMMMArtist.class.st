Class {
	#name : #EMMMArtist,
	#superclass : #EMMMWithPlayable,
	#category : #'EMM-MusicLibrary'
}

{ #category : #comparing }
EMMMArtist >> <= anEMMArtist [
	^ self name < anEMMArtist name
]

{ #category : #comparing }
EMMMArtist >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ name = anObject name
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
