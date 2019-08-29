Class {
	#name : #PMCWithPlayable,
	#superclass : #Object,
	#instVars : [
		'songs',
		'name'
	],
	#category : #'PMC-MusicLibrary'
}

{ #category : #adding }
PMCWithPlayable >> addSong: aPlayable [
	self songs add: aPlayable
]

{ #category : #adding }
PMCWithPlayable >> name [
	 ^ name
]

{ #category : #accessing }
PMCWithPlayable >> name: anObject [
	name := anObject
]

{ #category : #adding }
PMCWithPlayable >> songs [
	 ^ songs
]

{ #category : #accessing }
PMCWithPlayable >> songs: anObject [
	songs := anObject
]
