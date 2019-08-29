Class {
	#name : #PMCOverviewPage,
	#superclass : #PMCPage,
	#instVars : [
		'moduleInstances'
	],
	#category : #'PMC-WebApplication-Pages'
}

{ #category : #accessing }
PMCOverviewPage class >> pageName [
	^ 'Overview'
]

{ #category : #accessing }
PMCOverviewPage class >> priority [
	^ 1
]

{ #category : #accessing }
PMCOverviewPage >> initialize [
	super initialize.
	self moduleInstances: Dictionary new
]

{ #category : #accessing }
PMCOverviewPage >> moduleInstanceOf: aComponentClass [
	^ self moduleInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ]
]

{ #category : #accessing }
PMCOverviewPage >> moduleInstances [
	"I return a dictionary with browsers as keys and their instances as value if they were instantiated at least once."

	^ moduleInstances
]

{ #category : #accessing }
PMCOverviewPage >> moduleInstances: aDictionary [
	moduleInstances := aDictionary
]

{ #category : #rendering }
PMCOverviewPage >> renderContentOn: html [
	html mdlGrid
		with: [ PMCModule modulesToDisplay
				do: [ :module | 
					html mdlCell
						style: 'height: 400px; overflow: auto';
						size: (self moduleInstanceOf: module) size;
						shadow: 2;
						with: [ html render: (self moduleInstanceOf: module) ] ] ]
]
