Class {
	#name : #PMCStopwatchPage,
	#superclass : #PMCPage,
	#category : #'PMC-WebApplication-Pages'
}

{ #category : #accessing }
PMCStopwatchPage class >> pageName [
	^ 'Stopwatch'
]

{ #category : #accessing }
PMCStopwatchPage class >> priority [
	^ 100
]

{ #category : #rendering }
PMCStopwatchPage >> renderContentOn: html [
	html div style: 'min-height: 400px;'; with: 'Hello world'
]
