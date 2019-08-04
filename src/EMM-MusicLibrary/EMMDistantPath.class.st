Class {
	#name : #EMMDistantPath,
	#superclass : #EMMPath,
	#category : #'EMM-MusicLibrary'
}

{ #category : #accessing }
EMMDistantPath >> createMediaWithVLC: vlc [
	^ vlc mediaFileFromStringLocation: self path
]

{ #category : #testing }
EMMDistantPath >> isDistantPath [ 
	^ true
]
