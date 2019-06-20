Class {
	#name : #EMMJingleModule,
	#superclass : #EMMModule,
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMJingleModule class >> priority [
	^ 6
]

{ #category : #rendering }
EMMJingleModule >> renderContentOn: html [
	html mdlGrid
		shadow: 2;
		style: 'height: 96%';
		with: [ self session model jingles
				do: [ :jingle | 
					html mdlCell
						size: 1;
						with: [ html mdlAnchorButton
								callback: [ jingle play ];
								primaryColor;
								with: jingle name ] ] ]
]

{ #category : #accessing }
EMMJingleModule >> size [
	^ 12
]