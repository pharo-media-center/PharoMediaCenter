Class {
	#name : #EMMJingle,
	#superclass : #EMMPlayable,
	#instVars : [
		'name',
		'from',
		'duration'
	],
	#category : #'EMM-MusicLibrary'
}

{ #category : #accessing }
EMMJingle >> duration [
	^ duration
]

{ #category : #accessing }
EMMJingle >> duration: anObject [
	duration := anObject
]

{ #category : #accessing }
EMMJingle >> from [
	^ from
]

{ #category : #accessing }
EMMJingle >> from: anObject [
	from := anObject
]
