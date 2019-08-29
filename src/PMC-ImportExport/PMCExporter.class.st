Class {
	#name : #PMCExporter,
	#superclass : #PMCImportExporter,
	#category : #'PMC-ImportExport'
}

{ #category : #'as yet unclassified' }
PMCExporter >> exportLibrary: anEMMMusicLibrary [
	(self location / self libraryName) writeStream nextPutAll: (STON toString: anEMMMusicLibrary); flush
]
