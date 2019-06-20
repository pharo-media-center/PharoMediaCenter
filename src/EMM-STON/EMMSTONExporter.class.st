Class {
	#name : #EMMSTONExporter,
	#superclass : #Object,
	#category : #'EMM-STON'
}

{ #category : #'as yet unclassified' }
EMMSTONExporter >> export: anEMMMusicLibrary to: aFilereference [
	| stream | 
	stream := aFilereference writeStream.
	STON put: anEMMMusicLibrary onStreamPretty: stream.
	stream flush
]
