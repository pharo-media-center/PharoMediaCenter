Class {
	#name : #PMCListModule,
	#superclass : #PMCModule,
	#traits : 'TWithRootDialogComponent + PMCTDisplayList',
	#classTraits : 'TWithRootDialogComponent classTrait + PMCTDisplayList classTrait',
	#instVars : [
		'datas'
	],
	#category : #'PMC-WebApplication-Core'
}

{ #category : #accessing }
PMCListModule class >> priority [
	^ 2
]

{ #category : #rendering }
PMCListModule >> folderChanged: anEMMFolderSelectedAnnouncement [
	datas := anEMMFolderSelectedAnnouncement folder songs asSortedCollection: [:a :b | a name < b name ].
]

{ #category : #rendering }
PMCListModule >> initialize [
	datas := OrderedCollection new.
	SystemAnnouncer uniqueInstance weak when: PMCFolderSelectedAnnouncement send: #folderChanged: to: self
]

{ #category : #rendering }
PMCListModule >> renderContentOn: html [
	html mdlTable
		attributeAt: 'width' put: '100%';
		with: [ html
				tableHead: [ html
						tableRow: [ html mdlTableHeading with: 'N°'.
							html mdlTableHeading
								nonNumerical;
								with: 'Title'.
							html mdlTableHeading
								nonNumerical;
								with: 'Author'.
							html mdlTableHeading with: 'Length'.
							html mdlTableHeading ] ].
			html
				tableBody: [ datas
						doWithIndex: [ :song :index | 
							html
								tableRow: [ html mdlTableCell with: song track.
									html mdlTableCell
										nonNumerical;
										with: (song title ifNil: [ song name ]).
									html mdlTableCell
										nonNumerical;
										with: [ html text: (song artists asOrderedCollection ifNotEmpty: [ :col | col first name ] ifEmpty: [ 'No Author' ]) ].
									html mdlTableCell with: song length.
									html mdlTableCell
										nonNumerical;
										with: [ html mdlButton
												onClick: ((html jQuery id: self listId) load
														html: [ :canvas | 
															self session model playList: (datas copyFrom: index to: datas size).
															self renderListOn: canvas ];
														onComplete: 'componentHandler.upgradeDom();' js);
												colored;
												icon;
												with: [ html mdlIcon: 'play_arrow' ].
											self renderOn: html menuForPlayable: song ] ] ] ] ]
]

{ #category : #rendering }
PMCListModule >> renderDialogOn: html addPlayable: aPlayable [
	| selected |
	html
		form: [ html mdlDialogTitle: 'Add to Playlist'.
			html
				mdlDialogContent: [ html
						render:
							(MDLSelectWidget
								possibilities: self session model playlists asOrderedCollection
								inputLabel: 'Select Playlist'
								labelBlock: #name
								callback: [ :input | selected := input ]) ].
			html
				mdlDialogActions: [ html mdlButton
						beSubmit;
						callback: [ selected addSong: aPlayable ];
						with: 'Accept'.
					html mdlButton
						id: self rootDialogCloseId;
						with: 'Cancel' ] ]
]

{ #category : #rendering }
PMCListModule >> renderOn: html menuForPlayable: song [
	html mdlButton icon
		id: html nextId;
		with: [ html mdlIcon: #more_vert ].
	html mdlMenu
		bottomRight;
		for: html lastId;
		with: [ "
				with: 'Add to playlist';
				openDialogWithId: self rootDialogOpenId;
				onClickUpdateRootDialogWith: [ :r | self renderDialogOn: r addPlayble: song ]"
			html mdlMenuItem
				openDialogWithId: self rootDialogOpenId;
				onClickUpdateRootDialogWith: [ :r | self renderDialogOn: r addPlayable: song ];
				fullBleedDivider;
				with: 'Add in playlist'.
			html mdlMenuItem
				onClick:
					((html jQuery id: self listId) load
						html: [ :canvas | 
							self session model addNextPlayable: song.
							self renderListOn: canvas ];
						onComplete: 'componentHandler.upgradeDom();' js);
				"onClick: (html jQuery ajax callback: [ self session model addNextPlayable: song ]);"
					with: [ html text: 'Play next' ].
			html mdlMenuItem
				onClick:
					((html jQuery id: self listId) load
						html: [ :canvas | 
							self session model addAtTheEndPlayable: song.
							self renderListOn: canvas ];
						onComplete: 'componentHandler.upgradeDom();' js);
				with: [ html text: 'Play at the end' ] ]
]

{ #category : #accessing }
PMCListModule >> size [
	^ 8
]
