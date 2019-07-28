Class {
	#name : #VLCLibrary,
	#superclass : #FFILibrary,
	#instVars : [
		'vlcMediaPlayer',
		'libVLCInstance'
	],
	#category : #'EMM-SoundSystem-Library'
}

{ #category : #initialization }
VLCLibrary class >> reset [ 
	uniqueInstance := nil
]

{ #category : #creating }
VLCLibrary >> createPlayerForMedia: aVLCMedia [
	"example:
	
	| media player vlc |
	vlc := VLCLibrary uniqueInstance.
	media := vlc mediaFileFromStringPath: '/home/badetitou/Musique/Coda.mp3'.	
	player := vlc createPlayerForMedia: media.
	"

	^ self ffiCall: 'void* libvlc_media_player_new_from_media(void* aVLCMedia);'
]

{ #category : #initialization }
VLCLibrary >> initialize [
	super initialize.
	libVLCInstance := self initializeVLC
]

{ #category : #initialization }
VLCLibrary >> initializeVLC [
	^ self ffiCall: 'void * libvlc_new();'
]

{ #category : #'accessing platform' }
VLCLibrary >> libraryName [
	^ 'libvlc.so'
]

{ #category : #creating }
VLCLibrary >> mediaFileFromStringPath: aStringPath [
	"ex self mediaFileFromStringPath: '/home/badetitou/Musique/Coda.mp3'"
	^ self ffiCall: 'void* libvlc_media_new_path(void* libVLCInstance, String aStringPath);'
]

{ #category : #music }
VLCLibrary >> playPlayer: aPlayer [
	"
	| vlc media player |
	vlc := VLCLibrary uniqueInstance.
	media := vlc mediaFileFromStringPath: '/home/badetitou/Musique/Coda.mp3'.	
	player := vlc createPlayerForMedia: media.
	vlc playPlayer: player
	"
	^ self ffiCall: 'void * libvlc_media_player_play(void* aPlayer);'
]

{ #category : #'accessing platform' }
VLCLibrary >> unix32ModuleName [
	#('/usr/lib/i386-linux-gnu' '/usr/lib32' '/usr/lib') , ((OSEnvironment current at: 'LD_LIBRARY_PATH' ifAbsent: [ '' ]) substrings: ':')
		do: [ :path | 
			| libraryPath |
			libraryPath := path asFileReference / self libraryName.
			libraryPath exists ifTrue: [ ^ libraryPath fullName ] ].
	self error: 'Cannot locate cairo library. Please check if it installed on your system'
]

{ #category : #'accessing platform' }
VLCLibrary >> unix64ModuleName [
	#('/usr/lib/i386-linux-gnu' '/usr/lib32' '/usr/lib') , ((OSEnvironment current at: 'LD_LIBRARY_PATH' ifAbsent: [ '' ]) substrings: ':')
		do: [ :path | 
			| libraryPath |
			libraryPath := path asFileReference / self libraryName.
			libraryPath exists ifTrue: [ ^ libraryPath fullName ] ].
	self error: 'Cannot locate cairo library. Please check if it installed on your system'
]

{ #category : #'accessing platform' }
VLCLibrary >> unixModuleName [
	"Kept for backward compatibility. 
	 Users should use unix32* or unix64*"
	^ self unix64ModuleName
]
