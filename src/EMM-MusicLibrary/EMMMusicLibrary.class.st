Class {
	#name : #EMMMusicLibrary,
	#superclass : #Object,
	#instVars : [
		'artists',
		'settings',
		'songs',
		'directories',
		'jingles',
		'musicPlayer'
	],
	#category : #'EMM-MusicLibrary'
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
EMMMusicLibrary >> initialize [
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
EMMMusicLibrary >> songs [
	^ songs
]
