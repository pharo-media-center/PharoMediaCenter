Class {
	#name : #EMM,
	#superclass : #Object,
	#instVars : [
		'settings',
		'musicPlayer',
		'musicLibrary'
	],
	#category : #EMM
}

{ #category : #initialization }
EMM class >> resetAll [
	<script>
	EMM allInstancesDo: #initialize
]

{ #category : #'api - library' }
EMM >> addArtist: anEMMArtist [
	self musicLibrary addArtist: anEMMArtist
]

{ #category : #'api - library' }
EMM >> addJingle: anEMMJingle [
	self musicLibrary addJingle: anEMMJingle
]

{ #category : #'api - library' }
EMM >> addPlaylistNamed: playListName [
	self musicLibrary
		addPlaylist:
			(EMMMPlaylist new
				name: playListName;
				yourself)
]

{ #category : #'api - library' }
EMM >> artists [
	^ self musicLibrary artists
]

{ #category : #'api - music' }
EMM >> currentPlayable [
	^ self musicPlayer currentPlayable
]

{ #category : #initialization }
EMM >> defaultMusicLibrary [
	^ EMMMusicLibrary 
]

{ #category : #initialization }
EMM >> defaultMusicPlayer [
	^ EMMMusicPlayer  
]

{ #category : #'api - library' }
EMM >> directories [
	^ self musicLibrary directories
]

{ #category : #export }
EMM >> export [
	self exportMusicLibrary.
	self exportSettings
]

{ #category : #export }
EMM >> exportMusicLibrary [
	EMMExporter new exportLibrary: self musicLibrary
]

{ #category : #export }
EMM >> exportSettings [
]

{ #category : #import }
EMM >> folderImport [
	^ EMMFolderImporter new importFrom: self rootFolder in: self musicLibrary
]

{ #category : #import }
EMM >> import [
	^ self musicLibrary: EMMImporter new import
]

{ #category : #initialization }
EMM >> initialize [
	self settings: EMMMSettings new.
	self musicLibrary: self defaultMusicLibrary new.
	self musicPlayer: self defaultMusicPlayer new.
]

{ #category : #'api - music' }
EMM >> isPlaying [
	^ self musicPlayer isPlaying
]

{ #category : #'api - library' }
EMM >> jingles [
	^ self musicLibrary jingles 
]

{ #category : #accessing }
EMM >> musicLibrary [
	^ musicLibrary
]

{ #category : #accessing }
EMM >> musicLibrary: anObject [
	musicLibrary := anObject
]

{ #category : #accessing }
EMM >> musicPlayer [
	^ musicPlayer
]

{ #category : #accessing }
EMM >> musicPlayer: anObject [
	musicPlayer := anObject
]

{ #category : #'api - music' }
EMM >> next [
	self musicPlayer nextSound
]

{ #category : #'api - music' }
EMM >> pause [
	self musicPlayer pause
]

{ #category : #'api - music' }
EMM >> play [
	self musicPlayer play
]

{ #category : #'api - music' }
EMM >> playList [
	^ self musicPlayer musicList
]

{ #category : #'api - music' }
EMM >> playList: aListOfPlayable [
	self musicPlayer musicList: aListOfPlayable
]

{ #category : #'api - library' }
EMM >> playlists [
	^ self musicLibrary playlists
]

{ #category : #'api - music' }
EMM >> previous [
	self musicPlayer previousSound
]

{ #category : #api }
EMM >> reset [
	self musicPlayer reset
]

{ #category : #'api - music' }
EMM >> resume [
	self musicPlayer play
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

{ #category : #'api - library' }
EMM >> songs [
	^ self musicLibrary songs
]
