Class {
	#name : #EMMMusicLibrary,
	#superclass : #Object,
	#instVars : [
		'artists',
		'settings',
		'songs',
		'directories',
		'jingles',
		'musicPlayer',
		'playlists'
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
EMMMusicLibrary >> addPlaylist: anEMMMPlaylist [
	playlists add: anEMMMPlaylist
]

{ #category : #accessing }
EMMMusicLibrary >> addSong: aSong [
	songs add: aSong
]

{ #category : #accessing }
EMMMusicLibrary >> artists [
	^ artists
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
	playlists := Set new.
	directories := Dictionary new
]

{ #category : #accessing }
EMMMusicLibrary >> jingles [
	^ jingles 
]

{ #category : #accessing }
EMMMusicLibrary >> playlists [
	 ^ playlists
]

{ #category : #accessing }
EMMMusicLibrary >> songs [
	^ songs
]
