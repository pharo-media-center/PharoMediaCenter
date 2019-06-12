Class {
	#name : #EMMMusicPlayer,
	#superclass : #Object,
	#category : #EMM
}

{ #category : #'as yet unclassified' }
EMMMusicPlayer >> playSong: aSong [
	^ StreamingMP3Sound onFileNamed: aSong path originalString
]
