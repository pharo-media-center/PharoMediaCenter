Class {
	#name : #PMCFolderImporter,
	#superclass : #PMCImporter,
	#instVars : [
		'model'
	],
	#category : #'PMC-FolderImporter'
}

{ #category : #'as yet unclassified' }
PMCFolderImporter >> artistsDelimiter [
	^ ';'
]

{ #category : #'as yet unclassified' }
PMCFolderImporter >> createSongFromFile: file [
	| song artists id3parser folder |
	song := PMCMSong new.
	song name: file basenameWithoutExtension.
	"Try to parse ID3 metadata for MP3 files"
	id3parser := ID3Parser on: (File named: file originalString) readStream.
	[ artists := self ensureArtists: id3parser id3v2Tag artist ]
		on: FrameNotFoundError
		do: [ artists := Set
				with:
					(PMCArtist new
						name: 'unknow';
						yourself) ].
	artists do: [ :artist | artist addSong: song ].
	song artists addAll: artists.
	model songs add: song.
	folder := self ensureFolderFromFileReference: file parent.
	folder addSong: song.
	song folder: folder.
	[ song title: id3parser id3v2Tag title ]
		on: FrameNotFoundError
		do: [ song title: (self notDefineTitleFor: file) ].
	[ song track: id3parser id3v2Tag track asInteger ]
		on: FrameNotFoundError
		do: [ song track: self notDefineTrackValue ].
	[ song length: id3parser id3v2Tag length ]
		on: FrameNotFoundError
		do: [ song length: self notDefineTextValue ].
	song stringPath: file originalString.
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
	^ self importFromFolder: anArgument inAModel: anEMM
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
