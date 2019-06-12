Class {
	#name : #EMMPlaySong,
	#superclass : #Announcement,
	#instVars : [
		'song'
	],
	#category : #'EMM-WebApplication-Announcement'
}

{ #category : #accessing }
EMMPlaySong >> song [
	^ song
]

{ #category : #accessing }
EMMPlaySong >> song: anObject [
	song := anObject
]
