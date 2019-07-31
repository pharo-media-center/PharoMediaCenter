Class {
	#name : #EMMFoldersModule,
	#superclass : #EMMModule,
	#instVars : [
		'selectedElement'
	],
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMFoldersModule class >> priority [
	^ 1
]

{ #category : #rendering }
EMMFoldersModule >> artistsContentOn: html [
	html div
		with:
			((MDLNestedList elements: self session model artists asSortedCollection children: [ :child | #() ])
				format: [ :emmmDirectory | emmmDirectory name ];
				"helpBlock: [ :fileReference | fileReference fullPath fullName ];"
				selectedEntity: selectedElement;
				actionBlock: [ :class | self selectedElement: class ];
				yourself)
]

{ #category : #rendering }
EMMFoldersModule >> foldersContentOn: html [
	html div
		with:
			((MDLNestedList elements: self session model directories values children: [ :child | #() ])
				format: [ :emmmDirectory | emmmDirectory name ];
				"helpBlock: [ :fileReference | fileReference fullPath fullName ];"
				selectedEntity: selectedElement;
				actionBlock: [ :class | self selectedElement: class ];
				yourself)
]

{ #category : #rendering }
EMMFoldersModule >> playlistsContentOn: html [
	html div
		with:
			((MDLNestedList elements: self session model playlists asSortedCollection children: [ :child | #() ])
				format: [ :emmmDirectory | emmmDirectory name ];
				"helpBlock: [ :fileReference | fileReference fullPath fullName ];"
				selectedEntity: selectedElement;
				actionBlock: [ :class | self selectedElement: class ];
				yourself)
]

{ #category : #rendering }
EMMFoldersModule >> renderContentOn: html [
	self artistsContentOn: html.
]

{ #category : #rendering }
EMMFoldersModule >> selectedElement: class [
	selectedElement := class.
	SystemAnnouncer uniqueInstance announce: (EMMFolderSelectedAnnouncement new folder: class; yourself )
]
