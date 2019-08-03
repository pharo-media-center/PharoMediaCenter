Class {
	#name : #EMMFoldersModule,
	#superclass : #EMMModule,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
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
		style: 'position: relative;';
		with: [ html
				render:
					((MDLNestedList elements: self session model playlists asSortedCollection children: [ :child | #() ])
						format: [ :emmmDirectory | emmmDirectory name ];
						selectedEntity: selectedElement;
						actionBlock: [ :class | self selectedElement: class ];
						iconBlock: [ :entity | 
							html mdlButton icon
								id: html nextId;
								with: [ html mdlIcon: #more_vert ].
							html mdlMenu
								bottomRight;
								for: html lastId;
								with: [ html mdlMenuItem with: 'Play at the end' ].
								'' ];
						yourself).
			html mdlButton
				style: 'z-index: 10; position: absolute; top: 10px; right: 10px;';
				raised;
				fab;
				colored;
				openDialogWithId: self rootDialogOpenId;
				onClickUpdateRootDialogWith: [ :r | self renderAddPlaylistOn: r ];
				with: '+' ]
]

{ #category : #rendering }
EMMFoldersModule >> renderAddPlaylistOn: html [
	| name |
	html
		form: [ html mdlDialogTitle: 'Add playlist'.
			html
				mdlDialogContent: [ html mdlTextFieldContainer
						floatingLabel;
						with: [ html mdlTextFieldLabel
								for: html nextId;
								with: 'Name'.
							html mdlTextFieldInput
								id: html lastId;
								callback: [ :value | name := value ] ] ].
			html
				mdlDialogActions: [ html mdlButton
						beSubmit;
						callback: [ self session model addPlaylistNamed: name ];
						with: 'Accept'.
					html mdlButton
						id: self rootDialogCloseId;
						with: 'Cancel' ] ]
]

{ #category : #rendering }
EMMFoldersModule >> renderContentOn: html [
	html
		render:
			(MDLTabWidget new
				addTabNamed: 'Folders' content: [ self foldersContentOn: html ];
				addTabNamed: 'Artists' content: [ self artistsContentOn: html ];
				addTabNamed: 'Playlists' content: [ self playlistsContentOn: html ];
				yourself)
]

{ #category : #rendering }
EMMFoldersModule >> selectedElement: class [
	selectedElement := class.
	SystemAnnouncer uniqueInstance announce: (EMMFolderSelectedAnnouncement new folder: class; yourself )
]
