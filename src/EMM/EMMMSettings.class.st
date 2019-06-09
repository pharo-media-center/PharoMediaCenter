Class {
	#name : #EMMMSettings,
	#superclass : #Object,
	#instVars : [
		'rootFolder'
	],
	#category : #EMM
}

{ #category : #accessing }
EMMMSettings >> rootFolder [
	^ rootFolder ifNil: [ FileLocator home asFileReference / 'Music' ]
]

{ #category : #accessing }
EMMMSettings >> rootFolder: anObject [
	rootFolder := anObject
]
