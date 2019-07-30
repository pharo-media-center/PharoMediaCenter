Class {
	#name : #VLCEventTypeEnumeration,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'libvlc_MediaDurationChanged',
		'libvlc_MediaFreed',
		'libvlc_MediaListEndReached',
		'libvlc_MediaListItemAdded',
		'libvlc_MediaListItemDeleted',
		'libvlc_MediaListPlayerNextItemSet',
		'libvlc_MediaListPlayerPlayed',
		'libvlc_MediaListPlayerStopped',
		'libvlc_MediaListViewItemAdded',
		'libvlc_MediaListViewItemDeleted',
		'libvlc_MediaListViewWillAddItem',
		'libvlc_MediaListViewWillDeleteItem',
		'libvlc_MediaListWillAddItem',
		'libvlc_MediaListWillDeleteItem',
		'libvlc_MediaMetaChanged',
		'libvlc_MediaParsedChanged',
		'libvlc_MediaPlayerAudioDevice',
		'libvlc_MediaPlayerAudioVolume',
		'libvlc_MediaPlayerBackward',
		'libvlc_MediaPlayerBuffering',
		'libvlc_MediaPlayerChapterChanged',
		'libvlc_MediaPlayerCorked',
		'libvlc_MediaPlayerESAdded',
		'libvlc_MediaPlayerESDeleted',
		'libvlc_MediaPlayerESSelected',
		'libvlc_MediaPlayerEncounteredError',
		'libvlc_MediaPlayerEndReached',
		'libvlc_MediaPlayerForward',
		'libvlc_MediaPlayerLengthChanged',
		'libvlc_MediaPlayerMediaChanged',
		'libvlc_MediaPlayerMuted',
		'libvlc_MediaPlayerNothingSpecial',
		'libvlc_MediaPlayerOpening',
		'libvlc_MediaPlayerPausableChanged',
		'libvlc_MediaPlayerPaused',
		'libvlc_MediaPlayerPlaying',
		'libvlc_MediaPlayerPositionChanged',
		'libvlc_MediaPlayerScrambledChanged',
		'libvlc_MediaPlayerSeekableChanged',
		'libvlc_MediaPlayerSnapshotTaken',
		'libvlc_MediaPlayerStopped',
		'libvlc_MediaPlayerTimeChanged',
		'libvlc_MediaPlayerTitleChanged',
		'libvlc_MediaPlayerUncorked',
		'libvlc_MediaPlayerUnmuted',
		'libvlc_MediaPlayerVout',
		'libvlc_MediaStateChanged',
		'libvlc_MediaSubItemAdded',
		'libvlc_MediaSubItemTreeAdded',
		'libvlc_MediaThumbnailGenerated',
		'libvlc_RendererDiscovererItemAdded',
		'libvlc_RendererDiscovererItemDeleted'
	],
	#category : #'EMM-SoundSystem-Library'
}

{ #category : #'enum declaration' }
VLCEventTypeEnumeration class >> enumDecl [
	^ { (#libvlc_MediaMetaChanged -> 0).
	(#libvlc_MediaSubItemAdded -> 1).
	(#libvlc_MediaDurationChanged -> 2). 
	(#libvlc_MediaParsedChanged -> 3).
  	(#libvlc_MediaFreed -> 4).
	(#libvlc_MediaStateChanged -> 5).
	(#libvlc_MediaSubItemTreeAdded -> 6). 
	(#libvlc_MediaThumbnailGenerated -> 7). 
   (#libvlc_MediaPlayerMediaChanged -> 256).
	(#libvlc_MediaPlayerNothingSpecial -> 257).
	(#libvlc_MediaPlayerOpening -> 258).
	(#libvlc_MediaPlayerBuffering -> 259). 
  	(#libvlc_MediaPlayerPlaying -> 260). 
	(#libvlc_MediaPlayerPaused -> 261).
	(#libvlc_MediaPlayerStopped -> 262). 
	(#libvlc_MediaPlayerForward -> 263). 
	(#libvlc_MediaPlayerBackward -> 264). 
	(#libvlc_MediaPlayerEndReached -> 265). 
	(#libvlc_MediaPlayerEncounteredError -> 266). 
	(#libvlc_MediaPlayerTimeChanged -> 267).
	(#libvlc_MediaPlayerPositionChanged -> 268). 
	(#libvlc_MediaPlayerSeekableChanged -> 269). 
	(#libvlc_MediaPlayerPausableChanged -> 270). 
	(#libvlc_MediaPlayerTitleChanged -> 271).
	(#libvlc_MediaPlayerSnapshotTaken -> 272). 
	(#libvlc_MediaPlayerLengthChanged -> 273). 
	(#libvlc_MediaPlayerVout -> 274).
	(#libvlc_MediaPlayerScrambledChanged -> 275). 
	(#libvlc_MediaPlayerESAdded -> 276).
	(#libvlc_MediaPlayerESDeleted -> 277).
	(#libvlc_MediaPlayerESSelected -> 278).
	(#libvlc_MediaPlayerCorked -> 279).
	(#libvlc_MediaPlayerUncorked -> 280). 
	(#libvlc_MediaPlayerMuted -> 281).
	(#libvlc_MediaPlayerUnmuted -> 282). 
	(#libvlc_MediaPlayerAudioVolume -> 283). 
	(#libvlc_MediaPlayerAudioDevice -> 284). 
	(#libvlc_MediaPlayerChapterChanged -> 285). 
	(#libvlc_MediaListItemAdded -> 512). 
	(#libvlc_MediaListWillAddItem -> 513).
	(#libvlc_MediaListItemDeleted -> 514). 
	(#libvlc_MediaListWillDeleteItem -> 515). 
	(#libvlc_MediaListEndReached -> 516).
	(#libvlc_MediaListViewItemAdded -> 768).
  	(#libvlc_MediaListViewWillAddItem -> 769).
	(#libvlc_MediaListViewItemDeleted -> 770).
	(#libvlc_MediaListViewWillDeleteItem -> 771). 
	(#libvlc_MediaListPlayerPlayed -> 1024). 
	(#libvlc_MediaListPlayerNextItemSet -> 1025).
	(#libvlc_MediaListPlayerStopped -> 1026).
	(#libvlc_RendererDiscovererItemAdded -> 1282). 
	(#libvlc_RendererDiscovererItemDeleted -> 1283) } asDictionary
]

{ #category : #'enum declaration' }
VLCEventTypeEnumeration class >> initialize [
	self initializeEnumeration
]
