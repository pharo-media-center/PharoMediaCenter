Class {
	#name : #EMMJingleModule,
	#superclass : #EMMModule,
	#instVars : [
		'datas'
	],
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMJingleModule class >> priority [
	^ 6
]

{ #category : #rendering }
EMMJingleModule >> initialize [
	datas := OrderedCollection new
]

{ #category : #rendering }
EMMJingleModule >> renderContentOn: html [
	html mdlGrid
		shadow: 2;
		style: 'height: 96%';
		with: [ datas
				do: [ :data | 
					html mdlCell
						size: 1;
						with: [ html mdlAnchorButton
								callback: [ 'Test' crLog ];
								primaryColor;
								with: data name ] ] ]
]

{ #category : #accessing }
EMMJingleModule >> size [
	^ 12
]
