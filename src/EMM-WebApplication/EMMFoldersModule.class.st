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
		with: 'Selected element: ' , (selectedElement ifNil: [ 'No element selected: ', self session model settings rootFolder directories asString. ] ifNotNil: [ selectedElement printString ]).
	html div
		style: 'height: 400px';
		with:
			((MDLNestedList elements: WAObject allSubclasses children: [ :classOrMethod | classOrMethod isClass ifTrue: [ classOrMethod methods ] ifFalse: [ #() ] ])
				format: #name;
				helpBlock: #comment;
				selectedEntity: selectedElement;
				actionBlock: [ :class | selectedElement := class ];
				yourself)
]
