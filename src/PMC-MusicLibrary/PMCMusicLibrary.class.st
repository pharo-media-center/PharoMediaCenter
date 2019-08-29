Class {
	#name : #PMCMusicLibrary,
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
	#category : #'PMC-MusicLibrary'
}

{ #category : #accessing }
PMCMusicLibrary >> addArtist: anEMMArtist [
	artists add: anEMMArtist
]

{ #category : #accessing }
PMCMusicLibrary >> addJingle: anEMMJingle [
	jingles add: anEMMJingle
]

{ #category : #accessing }
PMCMusicLibrary >> addPlaylist: anEMMMPlaylist [
	playlists add: anEMMMPlaylist
]

{ #category : #accessing }
PMCMusicLibrary >> addSong: aSong [
	songs add: aSong
]

{ #category : #accessing }
PMCMusicLibrary >> artists [
	^ artists
]

{ #category : #accessing }
PMCMusicLibrary >> directories [
	^ directories
]

{ #category : #initialization }
PMCMusicLibrary >> initialize [
	songs := Set new.
	artists := Set new.
	jingles := Set new.
	playlists := Set new.
	directories := Dictionary new
]

{ #category : #accessing }
PMCMusicLibrary >> jingles [
	^ jingles 
]

{ #category : #accessing }
PMCMusicLibrary >> playlists [
	 ^ playlists
]

{ #category : #accessing }
PMCMusicLibrary >> removeJingle: anEMMJingle [
	jingles remove: anEMMJingle
]

{ #category : #accessing }
PMCMusicLibrary >> removePlaylist: anEMMMPlaylist [
	playlists remove: anEMMMPlaylist
]

{ #category : #accessing }
PMCMusicLibrary >> renamePlaylist: aPlaylist with: aNewName [
	aPlaylist name: aNewName
]

{ #category : #accessing }
PMCMusicLibrary >> songs [
	^ songs
]
