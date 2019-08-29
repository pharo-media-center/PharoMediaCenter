Class {
	#name : #PMCImportExporter,
	#superclass : #Object,
	#instVars : [
		'location',
		'libraryName',
		'settingsName'
	],
	#category : #'PMC-ImportExport'
}

{ #category : #private }
PMCImportExporter >> defaultLibraryName [
	^ 'emmMusicLibrary.json'
]

{ #category : #private }
PMCImportExporter >> defaultLocation [
	^ FileLocator home
]

{ #category : #private }
PMCImportExporter >> defaultSettingsName [
	^ 'emmSettings.json'
]

{ #category : #initialization }
PMCImportExporter >> initialize [
	super initialize.
	location := self defaultLocation.
	libraryName := self defaultLibraryName.
	settingsName := self defaultSettingsName.
]

{ #category : #accessing }
PMCImportExporter >> libraryName [
	^ libraryName
]

{ #category : #accessing }
PMCImportExporter >> libraryName: anObject [
	libraryName := anObject
]

{ #category : #accessing }
PMCImportExporter >> location [
	^ location
]

{ #category : #accessing }
PMCImportExporter >> location: anObject [
	location := anObject
]

{ #category : #accessing }
PMCImportExporter >> settingsName [
	^ settingsName
]

{ #category : #accessing }
PMCImportExporter >> settingsName: anObject [
	settingsName := anObject
]
