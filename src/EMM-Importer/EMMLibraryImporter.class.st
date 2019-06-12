Class {
	#name : #EMMLibraryImporter,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'EMM-Importer'
}

{ #category : #'as yet unclassified' }
EMMLibraryImporter >> artistsDelimiter [
	^ ';'
]

{ #category : #'as yet unclassified' }
EMMLibraryImporter >> createSongFromFile: file [
	| song artists id3parser | 
	song := EMMMSong new.
	song name: file basenameWithoutExtension.
	"Try to parse ID3 metadata for MP3 files"
	id3parser := ID3Parser on: (File named: file originalString) readStream.
	artists := (self ensureArtists: id3parser id3v2Tag artist).
	artists do: [:artist | artist addSong: song].
	song artists addAll: artists.
	model songs add: song.
	(self ensureFolderFromFileReference: file parent) addSong: song.
	^ song
]

{ #category : #'as yet unclassified' }
EMMLibraryImporter >> ensureArtist: authorString [
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
EMMLibraryImporter >> ensureArtists: aStringWithAuthors [
	^ (aStringWithAuthors substrings: self artistsDelimiter) collect: [ :authorString | self ensureArtist: authorString ]
]

{ #category : #'as yet unclassified' }
EMMLibraryImporter >> ensureFolderFromFileReference: directory [
	^ model directories at: directory ifAbsentPut: (EMMMFolder newFromFileReference: directory)
]

{ #category : #'as yet unclassified' }
EMMLibraryImporter >> importFromFolder: aFolder [
	| emmModel | 
	emmModel := EMMModel new.
	self importFromFolder: aFolder inAModel: emmModel. 
	^ emmModel
]

{ #category : #'as yet unclassified' }
EMMLibraryImporter >> importFromFolder: aFolder inAModel: anEMMModel [
	model := anEMMModel.
	 aFolder allDirectories
		do: [ :directory | 
			directory files
				do: [ :file | 
					file extension = 'mp3'
						ifTrue: [
							self createSongFromFile: file ] ] ]
]
