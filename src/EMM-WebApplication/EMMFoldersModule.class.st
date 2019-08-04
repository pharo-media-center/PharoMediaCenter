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
						iconBlock: [ :entity :r | 
							r mdlButton icon
								id: r nextId;
								with: [ r mdlIcon: #more_vert ].
							r mdlMenu
								bottomLeft;
								for: r lastId;
								"remove the css deleted by the fact we are in a list"
									style: 'display: block; width: auto';
								with: [ r mdlMenuItem
										style: 'line-height: 48px; width: auto';
										onClick: (html jQuery ajax callback: [ self session model removePlaylist: entity ]);
										with: 'Remove'.
									r mdlMenuItem
										style: 'line-height: 48px; width: auto';
										with: 'Rename' ].
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
				addTabNamed: 'Songs' content: [ self songsContentOn: html ];
				yourself)
]

{ #category : #rendering }
EMMFoldersModule >> selectedElement: class [
	selectedElement := class.
	SystemAnnouncer uniqueInstance announce: (EMMFolderSelectedAnnouncement new folder: class; yourself )
]

{ #category : #rendering }
EMMFoldersModule >> songsContentOn: html [
	html div
		style: 'position: relative;';
		with: [ html mdlAnchorButton
				callback: [ self selectedElement: self session model musicLibrary ];
				with: [ html text: 'All songs' ] ]
]
