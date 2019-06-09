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
	^ rootFolder ifNil: [ 'D:\Users\benoit.verhaeghe\Music' asFileReference ]
]

{ #category : #accessing }
EMMMSettings >> rootFolder: anObject [
	rootFolder := anObject
]
