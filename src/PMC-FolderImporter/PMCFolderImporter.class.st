Class {
	#name : #PMCFolderImporter,
	#superclass : #PMCImporter,
	#instVars : [
		'model',
		'vlc'
	],
	#category : #'PMC-FolderImporter'
}

{ #category : #'as yet unclassified' }
PMCFolderImporter >> artistsDelimiter [
	^ ';'
]

{ #category : #'as yet unclassified' }
PMCFolderImporter >> createSongFromFile: file [
	| song artists folder media |
	song := PMCMSong new.
	media := vlc createMediaFromPath: file fullName.
	media parseLocal.
	[ media parseStatus = VLCMediaParsedStatus libvlc_media_parsed_status_not_started ] whileTrue.
	song name: media title.
	song track: media trackNumber.
	song length: media duration.
	artists := self ensureArtists: media artist asString.
	artists do: [ :artist | artist addSong: song ].
	song artists addAll: artists.
	model songs add: song.
	folder := self ensureFolderFromFileReference: file parent.
	folder addSong: song.
	song folder: folder.
	song stringPath: file fullName.
	^ song
]

{ #category : #'as yet unclassified' }
PMCFolderImporter >> ensureArtist: authorString [
	^ model artists
		detect: [ :artist | artist name = authorString ]
		ifNone: [ 
			| artist |
			artist := PMCArtist new
				name: authorString;
				yourself.
			model addArtist: artist.
			artist ]
]

{ #category : #'as yet unclassified' }
PMCFolderImporter >> ensureArtists: aStringWithAuthors [
	^ (aStringWithAuthors substrings: self artistsDelimiter) collect: [ :authorString | self ensureArtist: authorString ]
]

{ #category : #'as yet unclassified' }
PMCFolderImporter >> ensureFolderFromFileReference: directory [
	^ model directories at: directory ifAbsentPut: (PMCFolder newFromFileReference: directory)
]

{ #category : #'as yet unclassified' }
PMCFolderImporter >> importFrom: anArgument in: anEMM [
	vlc := VLCLibrary uniqueInstance createVLCInstance.
	self importFromFolder: anArgument inAModel: anEMM.
	vlc vlcRelease.
	vlc := nil
]

{ #category : #'as yet unclassified' }
PMCFolderImporter >> importFromFolder: aFolder inAModel: anEMMModel [
	model := anEMMModel.
	 aFolder allDirectories
		do: [ :directory | 
			directory files
				do: [ :file | 
					file extension = 'mp3'
						ifTrue: [
							self createSongFromFile: file ] ] ]
]

{ #category : #'as yet unclassified' }
PMCFolderImporter >> notDefineTextValue [
	^ 'NotDef'
]

{ #category : #'as yet unclassified' }
PMCFolderImporter >> notDefineTitleFor: file [
	^ file basename
]

{ #category : #'as yet unclassified' }
PMCFolderImporter >> notDefineTrackValue [
	^ 0
]
