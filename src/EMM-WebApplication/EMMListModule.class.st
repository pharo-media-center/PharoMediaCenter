Class {
	#name : #EMMListModule,
	#superclass : #EMMModule,
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMListModule class >> priority [
	^ 5
]

{ #category : #rendering }
EMMListModule >> renderContentOn: html [
	| datas |
	datas := OrderedDictionary with: 'Acrylic (Transparent)' -> #('25' '$2.90') with: 'Plywood (Birch)' -> #('50' '$1.25') with: 'Laminate (Gold on Blue)' -> #('10' '$2.35').
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
						keysAndValuesDo: [ :title :members | 
							html
								tableRow: [ html mdlTableCell
										nonNumerical;
										with: title.
									members do: [ :data | html mdlTableCell: data ] ] ] ] ]
]
