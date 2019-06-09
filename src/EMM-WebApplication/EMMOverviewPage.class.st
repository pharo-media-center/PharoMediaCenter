Class {
	#name : #EMMOverviewPage,
	#superclass : #EMMPage,
	#instVars : [
		'moduleInstances'
	],
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

{ #category : #accessing }
EMMOverviewPage >> initialize [
	super initialize.
	self moduleInstances: Dictionary new
]

{ #category : #accessing }
EMMOverviewPage >> moduleInstanceOf: aComponentClass [
	^ self moduleInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ]
]

{ #category : #accessing }
EMMOverviewPage >> moduleInstances [
	"I return a dictionary with browsers as keys and their instances as value if they were instantiated at least once."

	^ moduleInstances
]

{ #category : #accessing }
EMMOverviewPage >> moduleInstances: aDictionary [
	moduleInstances := aDictionary
]

{ #category : #rendering }
EMMOverviewPage >> renderContentOn: html [
	html mdlGrid
		with: [ EMMModule modulesToDisplay
				do: [ :module | 
					html mdlCell
						size: 4;
						shadow: 2;
						with: [ html render: (self moduleInstanceOf: module) ] ] ]
]
