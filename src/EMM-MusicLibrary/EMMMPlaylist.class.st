Class {
	#name : #EMMMPlaylist,
	#superclass : #EMMMWithPlayable,
	#category : #'EMM-MusicLibrary'
}

{ #category : #comparing }
EMMMPlaylist >> <= anEMMMPlaylist [
	^ self name < anEMMMPlaylist name
]

{ #category : #accessing }
EMMMPlaylist >> initialize [
	songs := OrderedCollection new
]
