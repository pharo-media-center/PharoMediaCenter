Class {
	#name : #PMCJingle,
	#superclass : #PMCPlayable,
	#instVars : [
		'from',
		'duration'
	],
	#category : #'PMC-MusicLibrary'
}

{ #category : #accessing }
PMCJingle >> duration [
	^ duration
]

{ #category : #accessing }
PMCJingle >> duration: anObject [
	duration := anObject
]

{ #category : #accessing }
PMCJingle >> from [
	^ from
]

{ #category : #accessing }
PMCJingle >> from: anObject [
	from := anObject
]
