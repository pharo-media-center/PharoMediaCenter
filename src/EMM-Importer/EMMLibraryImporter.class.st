Class {
	#name : #EMMLibraryImporter,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'EMM-Importer'
}

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
						ifTrue: [ | song |
							song := EMMMSong newFromFile: file.
							anEMMModel songs add: song.
							(self ensureFolderFromFileReference: directory) addSong: song ] ] ]
]
