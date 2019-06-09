Class {
	#name : #EMMMusicPage,
	#superclass : #EMMPage,
	#category : #'EMM-WebApplication-Pages'
}

{ #category : #accessing }
EMMMusicPage class >> pageName [
	^ 'Music'
]

{ #category : #accessing }
EMMMusicPage class >> priority [
	^ 1
]

{ #category : #rendering }
EMMMusicPage >> renderContentOn: html [
	html div style: 'min-height: 400px;'; with: 'Hello world'
]
