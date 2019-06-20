Class {
	#name : #EMMSTONImporter,
	#superclass : #EMMImporter,
	#category : #'EMM-STON'
}

{ #category : #'as yet unclassified' }
EMMSTONImporter >> importFrom: aFileReference [
	^ STON fromStream: aFileReference readStream
]
