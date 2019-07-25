Class {
	#name : #EMM,
	#superclass : #Object,
	#instVars : [
		'artists',
		'settings',
		'songs',
		'directories',
		'jingles',
		'musicPlayer'
	],
	#category : #EMM
}

{ #category : #accessing }
EMM >> addArtist: anEMMArtist [
	artists add: anEMMArtist
]

{ #category : #accessing }
EMM >> addJingle: anEMMJingle [
	jingles add: anEMMJingle
]

{ #category : #accessing }
EMM >> artists [
	^ directories
]

{ #category : #accessing }
EMM >> currentMusic [
	^ self musicPlayer currentMusic
]

{ #category : #accessing }
EMM >> currentSound [
	^ self musicPlayer currentSound
]

{ #category : #accessing }
EMM >> directories [
	^ directories
]

{ #category : #initialization }
EMM >> import [
	^ EMMFolderImporter new importFromFolder: self rootFolder
]

{ #category : #initialization }
EMM >> initialize [
	self settings: EMMMSettings new.
	songs := Set new.
	artists := Set new.
	jingles := Set new.
	directories := Dictionary new
]

{ #category : #accessing }
EMM >> jingles [
	^ jingles 
]

{ #category : #accessing }
EMM >> musicPlayer [
	^ musicPlayer
]

{ #category : #accessing }
EMM >> musicPlayer: anObject [
	musicPlayer := anObject
]

{ #category : #accessing }
EMM >> rootFolder [
	^ self settings rootFolder
]

{ #category : #accessing }
EMM >> settings [
	^ settings
]

{ #category : #accessing }
EMM >> settings: anObject [
	settings := anObject
]

{ #category : #accessing }
EMM >> songs [
	^ songs
]
