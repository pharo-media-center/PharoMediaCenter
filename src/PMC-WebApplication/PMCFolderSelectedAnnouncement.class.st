Class {
	#name : #PMCFolderSelectedAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'folder'
	],
	#category : #'PMC-WebApplication-Announcement'
}

{ #category : #accessing }
PMCFolderSelectedAnnouncement >> folder [
	^ folder
]

{ #category : #accessing }
PMCFolderSelectedAnnouncement >> folder: anObject [
	folder := anObject
]
