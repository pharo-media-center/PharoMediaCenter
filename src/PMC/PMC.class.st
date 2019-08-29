Class {
	#name : #PMC,
	#superclass : #Object,
	#instVars : [
		'settings',
		'musicPlayer',
		'musicLibrary',
		'aListOfPlayable'
	],
	#category : #PMC
}

{ #category : #initialization }
PMC class >> resetAll [
	<script>
	PMC allInstancesDo: #initialize
]

{ #category : #'api - library' }
PMC >> addArtist: anEMMArtist [
	self musicLibrary addArtist: anEMMArtist
]

{ #category : #'api - music' }
PMC >> addAtTheEndPlayable: aPlayable [ 
	self musicPlayer addAtTheEnd: aPlayable
]

{ #category : #'api - library' }
PMC >> addJingle: anEMMJingle [
	self musicLibrary addJingle: anEMMJingle
]

{ #category : #'api - music' }
PMC >> addNextPlayable: aPlayable [ 
	self musicPlayer addNext: aPlayable
]

{ #category : #'api - library' }
PMC >> addPlaylistNamed: playListName [
	self musicLibrary
		addPlaylist:
			(PMCPlaylist new
				name: playListName;
				yourself)
]

{ #category : #'api - library' }
PMC >> addSong: aSong [
	self musicLibrary addSong: aSong
]

{ #category : #'api - library' }
PMC >> artists [
	^ self musicLibrary artists
]

{ #category : #'api - music' }
PMC >> currentPlayable [
	^ self musicPlayer currentPlayable
]

{ #category : #initialization }
PMC >> defaultMusicLibrary [
	^ PMCMusicLibrary 
]

{ #category : #initialization }
PMC >> defaultMusicPlayer [
	^ PMCMusicPlayer  
]

{ #category : #'api - library' }
PMC >> directories [
	^ self musicLibrary directories
]

{ #category : #export }
PMC >> export [
	self exportMusicLibrary.
	self exportSettings
]

{ #category : #export }
PMC >> exportMusicLibrary [
	PMCExporter new exportLibrary: self musicLibrary
]

{ #category : #export }
PMC >> exportSettings [
]

{ #category : #import }
PMC >> folderImport [
	^ PMCFolderImporter new importFrom: self rootFolder in: self musicLibrary
]

{ #category : #import }
PMC >> import [
	^ self musicLibrary: PMCImporter new import
]

{ #category : #initialization }
PMC >> initialize [
	self settings: PMCMSettings new.
	self musicLibrary: self defaultMusicLibrary new.
	self musicPlayer: self newDefaultMusicPlayer.
]

{ #category : #'api - music' }
PMC >> isPlaying [
	^ self musicPlayer isPlaying
]

{ #category : #settings }
PMC >> jingleWithVideo [
	^ self settings jingleWithVideo
]

{ #category : #settings }
PMC >> jingleWithVideo: aBoolean [
	self settings jingleWithVideo: aBoolean
]

{ #category : #'api - library' }
PMC >> jingles [
	^ self musicLibrary jingles 
]

{ #category : #accessing }
PMC >> musicLibrary [
	^ musicLibrary
]

{ #category : #accessing }
PMC >> musicLibrary: anObject [
	musicLibrary := anObject
]

{ #category : #accessing }
PMC >> musicPlayer [
	^ musicPlayer
]

{ #category : #accessing }
PMC >> musicPlayer: anObject [
	musicPlayer := anObject
]

{ #category : #creating }
PMC >> newDefaultMusicPlayer [
	^ PMCMusicPlayer withVideo: self settings withVideo
]

{ #category : #creating }
PMC >> newDefaultMusicPlayerForJingle [
	^ PMCMusicPlayer withVideo: self settings jingleWithVideo
]

{ #category : #'api - music' }
PMC >> next [
	self musicPlayer nextSound
]

{ #category : #'api - music' }
PMC >> pause [
	self musicPlayer pause
]

{ #category : #'api - music' }
PMC >> play [
	self musicPlayer play
]

{ #category : #'api - music' }
PMC >> playJingle: aJingle [
	self newDefaultMusicPlayerForJingle musicList: { aJingle }
]

{ #category : #'api - music' }
PMC >> playList [
	^ self musicPlayer musicList
]

{ #category : #'api - music' }
PMC >> playList: aListOfPlayable [
	self musicPlayer musicList: aListOfPlayable
]

{ #category : #'api - library' }
PMC >> playlists [
	^ self musicLibrary playlists
]

{ #category : #'api - music' }
PMC >> previous [
	self musicPlayer previousSound
]

{ #category : #'api - library' }
PMC >> removeJingle: aJingle [
	self musicLibrary
		removeJingle: aJingle
]

{ #category : #'api - library' }
PMC >> removePlaylist: aPlaylist [
	self musicLibrary
		removePlaylist: aPlaylist
]

{ #category : #'api - library' }
PMC >> renamePlaylist: aPlaylist with: aNewName [
	self musicLibrary
		renamePlaylist: aPlaylist with: aNewName
]

{ #category : #api }
PMC >> reset [
	self musicPlayer reset
]

{ #category : #'api - music' }
PMC >> resume [
	self musicPlayer play
]

{ #category : #accessing }
PMC >> rootFolder [
	^ self settings rootFolder
]

{ #category : #accessing }
PMC >> settings [
	^ settings
]

{ #category : #accessing }
PMC >> settings: anObject [
	settings := anObject
]

{ #category : #'api - library' }
PMC >> songs [
	^ self musicLibrary songs
]

{ #category : #settings }
PMC >> withVideo [
	^ self settings withVideo
]

{ #category : #settings }
PMC >> withVideo: aBoolean [
	self musicPlayer isPlaying ifTrue: [ self musicPlayer pause ].
	self settings withVideo: aBoolean.
	self musicPlayer: self newDefaultMusicPlayer
]
