Class {
	#name : #EMMStopwatchPage,
	#superclass : #EMMPage,
	#category : #'EMM-WebApplication-Pages'
}

{ #category : #accessing }
EMMStopwatchPage class >> pageName [
	^ 'Stopwatch'
]

{ #category : #accessing }
EMMStopwatchPage class >> priority [
	^ 100
]

{ #category : #rendering }
EMMStopwatchPage >> renderContentOn: html [
	html div style: 'min-height: 400px;'; with: 'Hello world'
]
