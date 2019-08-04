Class {
	#name : #EMMMSettings,
	#superclass : #Object,
	#instVars : [
		'rootFolder',
		'withVideo'
	],
	#category : #EMM
}

{ #category : #accessing }
EMMMSettings >> initialize [
	withVideo := false
]

{ #category : #accessing }
EMMMSettings >> rootFolder [
	^ rootFolder ifNil: [ '/home/badetitou/Musique' asFileReference ]
]

{ #category : #accessing }
EMMMSettings >> rootFolder: anObject [
	rootFolder := anObject
]

{ #category : #accessing }
EMMMSettings >> withVideo [
	^ withVideo
]

{ #category : #accessing }
EMMMSettings >> withVideo: anObject [
	withVideo := anObject
]
