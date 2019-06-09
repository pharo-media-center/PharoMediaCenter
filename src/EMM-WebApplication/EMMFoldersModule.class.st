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
		with: 'Selected element: ' , (selectedElement ifNil: [ 'No element selected' ] ifNotNil: [ selectedElement path fullName ]).
	html div
		style: 'height: 400px';
		with:
			((MDLNestedList elements: self session model settings rootFolder directories children: [ :child | #() ])
				format: [ :fileReference | fileReference path basename ];
				helpBlock: [ :fileReference | fileReference fullPath fullName ];
				selectedEntity: selectedElement;
				actionBlock: [ :class | selectedElement := class ];
				yourself)
]
