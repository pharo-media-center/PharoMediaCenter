Class {
	#name : #EMMListModule,
	#superclass : #EMMModule,
	#instVars : [
		'datas'
	],
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMListModule class >> priority [
	^ 5
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
							html mdlTableHeading: 'Lenght'.

							html mdlTableHeading
								nonNumerical;
								with: 'Play' ] ].
			html
				tableBody: [ datas
						do: [ :song | 
							html
								tableRow: [ html mdlTableCell with: song track asString.
									html mdlTableCell
										nonNumerical;
										with: song title.
									html mdlTableCell
										nonNumerical;
										with: song artists asOrderedCollection first name.
									html mdlTableCell with: song length.
									html mdlTableCell
										nonNumerical;
										with: [ song isPlaying
												ifTrue: [ html mdlAnchorButton
														callback: [ song pause ];
														colored;
														icon;
														with: [ html mdlIcon: 'stop' ] ]
												ifFalse: [ html mdlAnchorButton
														callback: [ song play ];
														colored;
														icon;
														with: [ html mdlIcon: 'play_arrow' ] ] ] ] ] ] ]
]

{ #category : #accessing }
EMMListModule >> size [
	^ 8
]
