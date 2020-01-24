"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	moduleInstances:		<Object>
	selectedElement:		<Object>


    Implementation Points
"
Class {
	#name : #PMCWAMusicPlaylists,
	#superclass : #PMCComponent,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#category : #'PMC-WebApplication-Pages'
}

{ #category : #accessing }
PMCWAMusicPlaylists class >> pageName [
	^ 'Music'
]

{ #category : #accessing }
PMCWAMusicPlaylists class >> priority [
	^ 10
]

{ #category : #rendering }
PMCWAMusicPlaylists >> renderAddPlaylistOn: html [
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
PMCWAMusicPlaylists >> renderContentOn: html [
html div
		style: 'position: relative;';
		with: [ html
				render:
					((MDLNestedList elements: (self session model playlists asSortedCollection: [ :a :b | a name <= b name ]) children: [ :child | #() ])
						format: [ :emmmDirectory | emmmDirectory name ];
						actionBlock: [ :class | class ];
						iconBlock: [ :entity :r | 
							r mdlButton icon
								id: r nextId;
								with: [ r mdlIcon: #more_vert ].
							r mdlMenu
								bottomLeft;
								for: r lastId;
								"remove the css deleted by the fact we are in a list"
									style: 'display: block; width: auto; z-position: 999;';
								with: [ r mdlMenuItem
										style: 'line-height: 48px; width: auto';
										onClick: (html jQuery ajax callback: [ self session model removePlaylist: entity ]);
										with: 'Remove'.
									r mdlMenuItem
										style: 'line-height: 48px; width: auto';
										openDialogWithId: self rootDialogOpenId;
										onClickUpdateRootDialogWith: [ :r2 | self renderRenamePlaylist: entity on: r2 ];
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
PMCWAMusicPlaylists >> renderRenamePlaylist: aPlaylist on: html [
	| name |
	html
		form: [ html mdlDialogTitle: 'Rename playlist'.
			html
				mdlDialogContent: [ html mdlTextFieldContainer
						floatingLabel;
						with: [ html mdlTextFieldLabel
								for: html nextId;
								with: 'Name'.
							html mdlTextFieldInput
								id: html lastId;
								value: aPlaylist name;
								callback: [ :value | name := value ] ] ].
			html
				mdlDialogActions: [ html mdlButton
						beSubmit;
						callback: [ self session model renamePlaylist: aPlaylist with: name ];
						with: 'Accept'.
					html mdlButton
						id: self rootDialogCloseId;
						with: 'Cancel' ] ]
]
