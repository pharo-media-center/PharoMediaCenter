Class {
	#name : #EMMOverviewPage,
	#superclass : #EMMPage,
	#category : #'EMM-WebApplication-Pages'
}

{ #category : #accessing }
EMMOverviewPage class >> pageName [
	^ 'Overview'
]

{ #category : #accessing }
EMMOverviewPage class >> priority [
	^ 1
]

{ #category : #rendering }
EMMOverviewPage >> renderContentOn: html [
	html mdlGrid
		with: [ EMMModule modulesToDisplay
				do: [ :module | 
					html mdlCell
						size: 4;
						shadow: 2;
						with: [ html render: module new ] ] ]
]
