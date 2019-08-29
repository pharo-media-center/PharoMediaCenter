Class {
	#name : #PMCPlaylist,
	#superclass : #PMCWithPlayable,
	#category : #'PMC-MusicLibrary'
}

{ #category : #comparing }
PMCPlaylist >> <= anEMMMPlaylist [
	^ self name < anEMMMPlaylist name
]

{ #category : #accessing }
PMCPlaylist >> initialize [
	songs := OrderedCollection new
]
