Class {
	#name : #EMMFoldersModule,
	#superclass : #EMMModule,
	#instVars : [
		'selectedElement'
	],
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMFoldersModule class >> priority [
	^ 4
]

{ #category : #rendering }
EMMFoldersModule >> renderContentOn: html [
	html div
		mdlTextColorAccent;
		with: 'Selected element: ' , (selectedElement ifNil: [ 'No element selected' ] ifNotNil: [ selectedElement name ]).
	html div
		style: 'height: 400px';
		with:
			((MDLNestedList elements: self session model directories values children: [ :child | #() ])
				format: [ :emmmDirectory | emmmDirectory name ];
				"helpBlock: [ :fileReference | fileReference fullPath fullName ];"
				selectedEntity: selectedElement;
				actionBlock: [ :class | selectedElement := class ];
				yourself)
]
