Class {
	#name : #EMMImporter,
	#superclass : #EMMImportExporter,
	#category : #'EMM-ImportExport'
}

{ #category : #'as yet unclassified' }
EMMImporter >> import [
	^ STON fromStream: (self location / self defaultLibraryName) readStream 
]

{ #category : #'as yet unclassified' }
EMMImporter >> importFrom: anArgument in: anEMM [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
EMMImporter >> importLibraryNamed: anLibraryName inFolder: aDefaultLocation [
	libraryName := anLibraryName.
	location := aDefaultLocation.
	^ self import.
]
