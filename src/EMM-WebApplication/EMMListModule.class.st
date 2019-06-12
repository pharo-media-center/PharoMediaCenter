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
		with: [ html
				tableHead: [ html
						tableRow: [ html mdlTableHeading
								nonNumerical;
								with: 'Title'.
							html mdlTableHeading: 'Lenght'.
							html mdlTableHeading: 'Author'.
							html mdlTableHeading: 'Play' ] ].
			html
				tableBody: [ datas
						do: [ :song | 
							html
								tableRow: [ html mdlTableCell
										nonNumerical;
										with: song name.
									html mdlTableCell
										nonNumerical;
										with: 'le'.
									html mdlTableCell
										nonNumerical;
										with: song artists asOrderedCollection first name.
									html mdlTableCell
										nonNumerical;
										with: [ html mdlAnchorButton
												callback: [ (EMMMusicPlayer new playSong: song) play. ];
												colored;
												icon;
												with: [ html mdlIcon: 'play_arrow' ] ] ] ] ] ]
]
