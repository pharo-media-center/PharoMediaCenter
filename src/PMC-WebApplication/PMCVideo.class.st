Class {
	#name : #PMCVideo,
	#superclass : #PMCComponent,
	#category : #'PMC-WebApplication-Widget'
}

{ #category : #rendering }
PMCVideo >> renderContentOn: html [
	html video with: [ html source  ]
]
