Class {
	#name : #PMCMusicPage,
	#superclass : #PMCPage,
	#category : #'PMC-WebApplication-Pages'
}

{ #category : #accessing }
PMCMusicPage class >> pageName [
	^ 'Music'
]

{ #category : #accessing }
PMCMusicPage class >> priority [
	^ 10
]

{ #category : #rendering }
PMCMusicPage >> renderContentOn: html [
	html div style: 'min-height: 400px;'; with:  self session model settings rootFolder asString.
]
