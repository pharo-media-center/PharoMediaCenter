Class {
	#name : #EMMImportExporter,
	#superclass : #Object,
	#instVars : [
		'location',
		'libraryName',
		'settingsName'
	],
	#category : #'EMM-ImportExport'
}

{ #category : #private }
EMMImportExporter >> defaultLibraryName [
	^ 'emmMusicLibrary.json'
]

{ #category : #private }
EMMImportExporter >> defaultLocation [
	^ FileLocator home
]

{ #category : #private }
EMMImportExporter >> defaultSettingsName [
	^ 'emmSettings.json'
]

{ #category : #initialization }
EMMImportExporter >> initialize [
	super initialize.
	location := self defaultLocation.
	libraryName := self defaultLibraryName.
	settingsName := self defaultSettingsName.
]

{ #category : #accessing }
EMMImportExporter >> libraryName [
	^ libraryName
]

{ #category : #accessing }
EMMImportExporter >> libraryName: anObject [
	libraryName := anObject
]

{ #category : #accessing }
EMMImportExporter >> location [
	^ location
]

{ #category : #accessing }
EMMImportExporter >> location: anObject [
	location := anObject
]

{ #category : #accessing }
EMMImportExporter >> settingsName [
	^ settingsName
]

{ #category : #accessing }
EMMImportExporter >> settingsName: anObject [
	settingsName := anObject
]
