Class {
	#name : #EMMPauseSong,
	#superclass : #Announcement,
	#instVars : [
		'song'
	],
	#category : #'EMM-WebApplication-Announcement'
}

{ #category : #accessing }
EMMPauseSong >> song [
	^ song
]

{ #category : #accessing }
EMMPauseSong >> song: anObject [
	song := anObject
]
