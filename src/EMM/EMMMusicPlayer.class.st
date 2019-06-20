Class {
	#name : #EMMMusicPlayer,
	#superclass : #Object,
	#category : #EMM
}

{ #category : #'as yet unclassified' }
EMMMusicPlayer >> playSong: aPlayable [
	^ StreamingMP3Sound onFileNamed: aPlayable path originalString
]
