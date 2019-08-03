Class {
	#name : #EMMExporter,
	#superclass : #EMMImportExporter,
	#category : #'EMM-ImportExport'
}

{ #category : #'as yet unclassified' }
EMMExporter >> exportLibrary: anEMMMusicLibrary [
	(self location / self libraryName) writeStream nextPutAll: (STON toString: anEMMMusicLibrary); flush
]
