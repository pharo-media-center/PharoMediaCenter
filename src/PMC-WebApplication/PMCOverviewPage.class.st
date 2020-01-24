Class {
	#name : #PMCOverviewPage,
	#superclass : #PMCPage,
	#instVars : [
		'moduleInstances'
	],
	#category : #'PMC-WebApplication-Pages'
}

{ #category : #accessing }
PMCOverviewPage class >> pageName [
	^ 'Overview'
]

{ #category : #accessing }
PMCOverviewPage class >> priority [
	^ 1
]

{ #category : #rendering }
PMCOverviewPage >> renderContentOn: html [
	html div style: 'min-height: 400px;'; with: 'This is the overview page, go to music to begin'.
]
