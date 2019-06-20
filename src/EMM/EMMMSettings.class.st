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
	^ rootFolder ifNil: [ 'D:\Users\benoit.verhaeghe\Music\EMM\Musics' asFileReference ]
]

{ #category : #accessing }
EMMMSettings >> rootFolder: anObject [
	rootFolder := anObject
]
