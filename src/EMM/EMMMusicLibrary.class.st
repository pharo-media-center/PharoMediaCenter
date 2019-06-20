Class {
	#name : #EMMMusicLibrary,
	#superclass : #Object,
	#instVars : [
		'artists',
		'settings',
		'songs',
		'directories',
		'jingles'
	],
	#category : #EMM
}

{ #category : #accessing }
EMMMusicLibrary >> addArtist: anEMMArtist [
	artists add: anEMMArtist
]

{ #category : #accessing }
EMMMusicLibrary >> addJingle: anEMMJingle [
	jingles add: anEMMJingle
]

{ #category : #accessing }
EMMMusicLibrary >> artists [
	^ directories
]

{ #category : #accessing }
EMMMusicLibrary >> directories [
	^ directories
]

{ #category : #initialization }
EMMMusicLibrary >> import [
	^ EMMFolderImporter new importFromFolder: self rootFolder
]

{ #category : #initialization }
EMMMusicLibrary >> initialize [
	self settings: EMMMSettings new.
	songs := Set new.
	artists := Set new.
	jingles := Set new.
	directories := Dictionary new
]

{ #category : #accessing }
EMMMusicLibrary >> jingles [
	^ jingles 
]

{ #category : #accessing }
EMMMusicLibrary >> rootFolder [
	^ self settings rootFolder
]

{ #category : #accessing }
EMMMusicLibrary >> settings [
	^ settings
]

{ #category : #accessing }
EMMMusicLibrary >> settings: anObject [
	settings := anObject
]

{ #category : #accessing }
EMMMusicLibrary >> songs [
	^ songs
]
