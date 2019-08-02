Class {
	#name : #EMMMWithPlayable,
	#superclass : #Object,
	#instVars : [
		'songs',
		'name'
	],
	#category : #'EMM-MusicLibrary'
}

{ #category : #adding }
EMMMWithPlayable >> addSong: aPlayable [
	self songs add: aPlayable
]

{ #category : #adding }
EMMMWithPlayable >> name [
	 ^ name
]

{ #category : #accessing }
EMMMWithPlayable >> name: anObject [
	name := anObject
]

{ #category : #adding }
EMMMWithPlayable >> songs [
	 ^ songs
]

{ #category : #accessing }
EMMMWithPlayable >> songs: anObject [
	songs := anObject
]
