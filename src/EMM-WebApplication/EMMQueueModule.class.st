Class {
	#name : #EMMQueueModule,
	#superclass : #EMMModule,
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMQueueModule class >> priority [
	^ 3
]

{ #category : #rendering }
EMMQueueModule >> renderContentOn: html [
	| datas |
	datas := self session musicPlayer musicList.
	html mdlTable
		with: [ html
				tableHead: [ html
						tableRow: [ html mdlTableHeading
								nonNumerical;
								with: 'Title'.
							html mdlTableHeading: 'Lenght'.
							html mdlTableHeading: 'Author' ] ].
			html
				tableBody: [ datas
						do: [ :song | 
							html
								tableRow: [ html mdlTableCell with: song track.
									html mdlTableCell
										nonNumerical;
										with: song title.
									html mdlTableCell
										nonNumerical;
										with: song artists asOrderedCollection first name.
									html mdlTableCell with: song length ] ] ] ]
]
