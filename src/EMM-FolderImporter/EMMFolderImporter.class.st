Class {
	#name : #EMMFolderImporter,
	#superclass : #EMMImporter,
	#instVars : [
		'model'
	],
	#category : #'EMM-FolderImporter'
}

{ #category : #'as yet unclassified' }
EMMFolderImporter >> artistsDelimiter [
	^ ';'
]

{ #category : #'as yet unclassified' }
EMMFolderImporter >> createSongFromFile: file [
	| song artists id3parser folder |
	song := EMMMSong new.
	song name: file basenameWithoutExtension.
	"Try to parse ID3 metadata for MP3 files"
	id3parser := ID3Parser on: (File named: file originalString) readStream.
	[artists := self ensureArtists: id3parser id3v2Tag artist]  on: FrameNotFoundError
		do: [ artists := Set with: (EMMMArtist new name: 'unknow'; yourself) ].
	artists do: [ :artist | artist addSong: song ].
	song artists addAll: artists.
	model songs add: song.
	folder := self ensureFolderFromFileReference: file parent.
	folder addSong: song.
	song folder: folder.
	[ song title: id3parser id3v2Tag title ] on: FrameNotFoundError
		do: [ song title: (self notDefineTitleFor: file) ].
	[song track: id3parser id3v2Tag track asInteger] on: FrameNotFoundError
		do: [ song track: self notDefineTrackValue ].
	[ song length: id3parser id3v2Tag length ]
		on: FrameNotFoundError
		do: [ song length: self notDefineTextValue ].
	song path: file.
	^ song
]

{ #category : #'as yet unclassified' }
EMMFolderImporter >> ensureArtist: authorString [
	^ model artists
		detect: [ :artist | artist name = authorString ]
		ifNone: [ 
			| artist |
			artist := EMMMArtist new
				name: authorString;
				yourself.
			model addArtist: artist.
			artist ]
]

{ #category : #'as yet unclassified' }
EMMFolderImporter >> ensureArtists: aStringWithAuthors [
	^ (aStringWithAuthors substrings: self artistsDelimiter) collect: [ :authorString | self ensureArtist: authorString ]
]

{ #category : #'as yet unclassified' }
EMMFolderImporter >> ensureFolderFromFileReference: directory [
	^ model directories at: directory ifAbsentPut: (EMMMFolder newFromFileReference: directory)
]

{ #category : #'as yet unclassified' }
EMMFolderImporter >> importFrom: anArgument [
	^ self importFromFolder: anArgument
]

{ #category : #'as yet unclassified' }
EMMFolderImporter >> importFromFolder: aFolder [
	| emmModel | 
	emmModel := EMMMusicLibrary new.
	self importFromFolder: aFolder inAModel: emmModel. 
	^ emmModel
]

{ #category : #'as yet unclassified' }
EMMFolderImporter >> importFromFolder: aFolder inAModel: anEMMModel [
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
EMMFolderImporter >> notDefineTextValue [
	^ 'NotDef'
]

{ #category : #'as yet unclassified' }
EMMFolderImporter >> notDefineTitleFor: file [
	^ file basename
]

{ #category : #'as yet unclassified' }
EMMFolderImporter >> notDefineTrackValue [
	^ 0
]
