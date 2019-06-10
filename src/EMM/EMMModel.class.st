Class {
	#name : #EMMModel,
	#superclass : #Object,
	#instVars : [
		'settings',
		'songs',
		'directories'
	],
	#category : #EMM
}

{ #category : #accessing }
EMMModel >> directories [
	^ directories
]

{ #category : #initialization }
EMMModel >> ensureFolderFromFileReference: directory [
	^ directories at: directory ifAbsentPut: (EMMMFolder newFromFileReference: directory)
]

{ #category : #initialization }
EMMModel >> import [
	self rootFolder allDirectories
		do: [ :directory | 
			directory files
				do: [ :file | 
					file extension = 'mp3'
						ifTrue: [ | song |
							song := EMMMSong newFromFile: file.
							songs add: song.
							(self ensureFolderFromFileReference: directory) addSong: song ] ] ]
]

{ #category : #initialization }
EMMModel >> initialize [
	self settings: EMMMSettings new.
	songs := Set new.
	directories := Dictionary new
]

{ #category : #accessing }
EMMModel >> rootFolder [
	^ self settings rootFolder
]

{ #category : #accessing }
EMMModel >> settings [
	^ settings
]

{ #category : #accessing }
EMMModel >> settings: anObject [
	settings := anObject
]
