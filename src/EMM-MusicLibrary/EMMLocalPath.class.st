Class {
	#name : #EMMLocalPath,
	#superclass : #EMMPath,
	#category : #'EMM-MusicLibrary'
}

{ #category : #'as yet unclassified' }
EMMLocalPath >> createMediaWithVLC: vlc [
	^ vlc mediaFileFromStringPath: self path originalString
]

{ #category : #testing }
EMMLocalPath >> isLocalPath [
	^ true
]

{ #category : #testing }
EMMLocalPath >> path: aPath [
	path := aPath asFileReference
]
