Class {
	#name : #EMMSettingsPage,
	#superclass : #EMMPage,
	#category : #'EMM-WebApplication-Pages'
}

{ #category : #accessing }
EMMSettingsPage class >> pageName [
	^ 'Settings'
]

{ #category : #accessing }
EMMSettingsPage class >> priority [
	^ 999
]

{ #category : #rendering }
EMMSettingsPage >> renderContentOn: html [
	html div style: 'min-height: 400px;'; with: 'Settings'
]
