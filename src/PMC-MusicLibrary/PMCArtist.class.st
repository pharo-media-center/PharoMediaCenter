Class {
	#name : #PMCArtist,
	#superclass : #PMCWithPlayable,
	#category : #'PMC-MusicLibrary'
}

{ #category : #comparing }
PMCArtist >> <= anEMMArtist [
	^ self name < anEMMArtist name
]

{ #category : #comparing }
PMCArtist >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #comparing }
PMCArtist >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash
]

{ #category : #accessing }
PMCArtist >> initialize [
	songs := Set new
]
