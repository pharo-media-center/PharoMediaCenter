Class {
	#name : #PMCImporter,
	#superclass : #PMCImportExporter,
	#category : #'PMC-ImportExport'
}

{ #category : #'as yet unclassified' }
PMCImporter >> import [
	^ STON fromStream: (self location / self defaultLibraryName) readStream 
]

{ #category : #'as yet unclassified' }
PMCImporter >> importFrom: anArgument in: anEMM [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
PMCImporter >> importLibraryNamed: anLibraryName inFolder: aDefaultLocation [
	libraryName := anLibraryName.
	location := aDefaultLocation.
	^ self import.
]
