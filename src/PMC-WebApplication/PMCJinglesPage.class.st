Class {
	#name : #PMCJinglesPage,
	#superclass : #PMCPage,
	#instVars : [
		'moduleInstances'
	],
	#category : #'PMC-WebApplication-Pages'
}

{ #category : #accessing }
PMCJinglesPage class >> pageName [
	^ 'Jingles'
]

{ #category : #accessing }
PMCJinglesPage class >> priority [
	^ 2
]

{ #category : #accessing }
PMCJinglesPage >> initialize [
	super initialize.
	self moduleInstances: Dictionary new
]

{ #category : #accessing }
PMCJinglesPage >> moduleInstanceOf: aComponentClass [
	^ self moduleInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ]
]

{ #category : #accessing }
PMCJinglesPage >> moduleInstances [
	"I return a dictionary with browsers as keys and their instances as value if they were instantiated at least once."

	^ moduleInstances
]

{ #category : #accessing }
PMCJinglesPage >> moduleInstances: aDictionary [
	moduleInstances := aDictionary
]

{ #category : #rendering }
PMCJinglesPage >> renderContentOn: html [
	html render: (self moduleInstanceOf: PMCJingleModule)
]
