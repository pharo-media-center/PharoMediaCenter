Class {
	#name : #PMCPlaySong,
	#superclass : #Announcement,
	#instVars : [
		'song'
	],
	#category : #'PMC-WebApplication-Announcement'
}

{ #category : #accessing }
PMCPlaySong >> song [
	^ song
]

{ #category : #accessing }
PMCPlaySong >> song: anObject [
	song := anObject
]
