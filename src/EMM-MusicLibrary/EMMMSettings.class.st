Class {
	#name : #EMMMSettings,
	#superclass : #Object,
	#instVars : [
		'rootFolder'
	],
	#category : #'EMM-MusicLibrary'
}

{ #category : #accessing }
EMMMSettings >> rootFolder [
	^ rootFolder ifNil: [ '/home/badetitou/Musique' asFileReference ]
]

{ #category : #accessing }
EMMMSettings >> rootFolder: anObject [
	rootFolder := anObject
]
