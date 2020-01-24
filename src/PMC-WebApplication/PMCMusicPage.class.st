Class {
	#name : #PMCMusicPage,
	#superclass : #PMCPage,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#instVars : [
		'moduleInstances',
		'selectedElement'
	],
	#category : #'PMC-WebApplication-Pages'
}

{ #category : #accessing }
PMCMusicPage class >> pageName [
	^ 'Music'
]

{ #category : #accessing }
PMCMusicPage class >> priority [
	^ 10
]

{ #category : #accessing }
PMCMusicPage >> initialize [
	super initialize.
	self moduleInstances: Dictionary new
]

{ #category : #accessing }
PMCMusicPage >> moduleInstanceOf: aComponentClass [
	^ self moduleInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ]
]

{ #category : #accessing }
PMCMusicPage >> moduleInstances [
	"I return a dictionary with browsers as keys and their instances as value if they were instantiated at least once."

	^ moduleInstances
]

{ #category : #accessing }
PMCMusicPage >> moduleInstances: aDictionary [
	moduleInstances := aDictionary
]

{ #category : #rendering }
PMCMusicPage >> renderContentOn: html [
	html
		render:
			(MDLTabWidget new
				addTabNamed: 'Folders' content: [ html render: PMCWAMusicFolders new ];
				addTabNamed: 'Artists' content: [ html render: PMCWAMusicArtists new ];
				addTabNamed: 'Playlists' content: [ html render: PMCWAMusicPlaylists new ];
				addTabNamed: 'Songs' content: [ html render: PMCWAMusicSongs new ];
				yourself)
]

{ #category : #accessing }
PMCMusicPage >> rootDialogCloseId [
	"I am the id to put on a button to close the root dialog.
	This is static information available on class side"

	^ self class rootDialogCloseId
]

{ #category : #accessing }
PMCMusicPage >> rootDialogId [
	"I am the id of the root dialog.
	This is static information available on class side"

	^ self class rootDialogId
]

{ #category : #accessing }
PMCMusicPage >> rootDialogOpenId [
	"I am the Id to put on a button in order to open the root dialog."

	^ self class rootDialogOpenId
]

{ #category : #rendering }
PMCMusicPage >> selectedElement: class [
	selectedElement := class.
	SystemAnnouncer uniqueInstance announce: (PMCFolderSelectedAnnouncement new folder: class; yourself )
]
