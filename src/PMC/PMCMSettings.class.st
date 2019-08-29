Class {
	#name : #PMCMSettings,
	#superclass : #Object,
	#instVars : [
		'rootFolder',
		'withVideo',
		'jingleWithVideo'
	],
	#category : #PMC
}

{ #category : #accessing }
PMCMSettings >> initialize [
	withVideo := false.
	jingleWithVideo := false
]

{ #category : #accessing }
PMCMSettings >> jingleWithVideo [
	^ jingleWithVideo
]

{ #category : #accessing }
PMCMSettings >> jingleWithVideo: anObject [
	jingleWithVideo := anObject
]

{ #category : #accessing }
PMCMSettings >> rootFolder [
	^ rootFolder ifNil: [ '/home/badetitou/Musique' asFileReference ]
]

{ #category : #accessing }
PMCMSettings >> rootFolder: anObject [
	rootFolder := anObject
]

{ #category : #accessing }
PMCMSettings >> withVideo [
	^ withVideo
]

{ #category : #accessing }
PMCMSettings >> withVideo: anObject [
	withVideo := anObject
]
