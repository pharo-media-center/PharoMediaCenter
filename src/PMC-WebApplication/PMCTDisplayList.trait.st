Trait {
	#name : #PMCTDisplayList,
	#category : #'PMC-WebApplication'
}

{ #category : #rendering }
PMCTDisplayList >> dataPlaylist [
	^ self session model playList
]

{ #category : #rendering }
PMCTDisplayList >> listId [
	^ #listID
]

{ #category : #rendering }
PMCTDisplayList >> renderListOn: html [
	| datas |
	datas := self dataPlaylist.
	html mdlTable
		attributeAt: 'width' put: '100%';
		with: [ html
				tableHead: [ html
						tableRow: [ html mdlTableHeading
								nonNumerical;
								with: 'Title'.
							html mdlTableHeading: 'Lenght'.
							html mdlTableHeading: 'Author' ].
					html
						tableBody: [ datas
								do: [ :song | 
									html
										tableRow: [ html mdlTableCell
												nonNumerical;
												with: (song title ifNil: [ song name ]).
											html mdlTableCell
												nonNumerical;
												with: [ html text: (song artists asOrderedCollection ifNotEmpty: [ :col | col first name ] ifEmpty: [ 'No Author' ]) ].
											html mdlTableCell with: song length ] ] ] ] ]
]
