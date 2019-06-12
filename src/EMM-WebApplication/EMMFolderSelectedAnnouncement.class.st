Class {
	#name : #EMMFolderSelectedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'folder'
	],
	#category : #'EMM-WebApplication-Announcement'
}

{ #category : #accessing }
EMMFolderSelectedAnnouncement >> folder [
	^ folder
]

{ #category : #accessing }
EMMFolderSelectedAnnouncement >> folder: anObject [
	folder := anObject
]
