Class {
	#name : #EMM,
	#superclass : #Object,
	#instVars : [
		'artists',
		'settings',
		'songs',
		'directories',
		'jingles',
		'musicPlayer',
		'musicLibrary'
	],
	#category : #EMM
}

{ #category : #'api - library' }
EMM >> addArtist: anEMMArtist [
	artists add: anEMMArtist
]

{ #category : #'api - library' }
EMM >> addJingle: anEMMJingle [
	jingles add: anEMMJingle
]

{ #category : #'api - library' }
EMM >> artists [
	^ directories
]

{ #category : #'api - music' }
EMM >> currentMusic [
	^ self musicPlayer currentMusic
]

{ #category : #'api - music' }
EMM >> currentSound [
	^ self musicPlayer currentSound
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
	^ directories
]

{ #category : #initialization }
EMM >> import [
	^ EMMFolderImporter new importFrom: self rootFolder in: self
]

{ #category : #initialization }
EMM >> initialize [
	self settings: EMMMSettings new.
	self musicLibrary: self defaultMusicLibrary new.
	self musicPlayer: self defaultMusicPlayer new.
]

{ #category : #'api - library' }
EMM >> jingles [
	^ jingles 
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
EMM >> play: aPlayable [
	self musicPlayer play: aPlayable
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
	^ songs
]
