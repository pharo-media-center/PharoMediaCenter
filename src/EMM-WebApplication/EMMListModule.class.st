Class {
	#name : #EMMListModule,
	#superclass : #EMMModule,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#instVars : [
		'datas'
	],
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMListModule class >> priority [
	^ 2
]

{ #category : #rendering }
EMMListModule >> folderChanged: anEMMFolderSelectedAnnouncement [
	datas := anEMMFolderSelectedAnnouncement folder songs asSortedCollection: [:a :b | a name < b name ].
]

{ #category : #rendering }
EMMListModule >> initialize [
	datas := OrderedCollection new.
	SystemAnnouncer uniqueInstance weak subscribe: EMMFolderSelectedAnnouncement
			send: #folderChanged:
			to: self.
]

{ #category : #rendering }
EMMListModule >> renderContentOn: html [
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
							html mdlTableHeading. ] ].
			html
				tableBody: [ datas
						doWithIndex: [ :song :index | 
							html
								tableRow: [ html mdlTableCell with: song track.
									html mdlTableCell
										nonNumerical;
										with: song title.
									html mdlTableCell
										nonNumerical;
										with: song artists asOrderedCollection first name.
									html mdlTableCell with: song length.
									html mdlTableCell
										nonNumerical;
										with: [ html mdlAnchorButton
												callback: [ self session model playList: (datas copyFrom: index to: datas size) ];
												colored;
												icon;
												with: [ html mdlIcon: 'play_arrow' ].
											self renderOn: html menuForPlayable: song ] ] ] ] ]
]

{ #category : #rendering }
EMMListModule >> renderDialogOn: html addPlayable: aPlayable [
	| selected |
	html mdlDialogTitle: 'Add to Playlist'.
	html
		mdlDialogContent: [ html
				form: [ html
						render:
							((MDLSelectWidget
								possibilities: self session model playlists
								inputLabel: 'Select Playlist'
								labelBlock: #name
								callback: [ :input | selected := input ]
								selectedObject: 3
								tooltip: 'description'
								sortBlock: [ :a :b | a <= b ])
								entryTooltip: [ :number | 'Choose number: ' , number asString ];
								customizationBlock:
										[ :textField :renderer | textField onChange: (html jQuery ajax serializeThis onComplete: ((html jQuery id: 'selectWithAjaxId') load html: [ :canvas | canvas text: 'Selected object: ' , selected asString ])) ];
								yourself) ] ].
	html
		mdlDialogActions: [ html mdlButton: 'Accept'.
			html mdlButton
				id: self rootDialogCloseId;
				with: 'Cancel' ]
]

{ #category : #rendering }
EMMListModule >> renderOn: html menuForPlayable: song [
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
				with: 'Open dialog' ]
]

{ #category : #accessing }
EMMListModule >> size [
	^ 8
]
