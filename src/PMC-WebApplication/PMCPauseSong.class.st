Class {
	#name : #PMCPauseSong,
	#superclass : #Announcement,
	#instVars : [
		'song'
	],
	#category : #'PMC-WebApplication-Announcement'
}

{ #category : #accessing }
PMCPauseSong >> song [
	^ song
]

{ #category : #accessing }
PMCPauseSong >> song: anObject [
	song := anObject
]
