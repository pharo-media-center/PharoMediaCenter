Class {
	#name : #EMMJinglesPage,
	#superclass : #EMMPage,
	#instVars : [
		'moduleInstances'
	],
	#category : #'EMM-WebApplication-Pages'
}

{ #category : #accessing }
EMMJinglesPage class >> pageName [
	^ 'Jingles'
]

{ #category : #accessing }
EMMJinglesPage class >> priority [
	^ 2
]

{ #category : #accessing }
EMMJinglesPage >> initialize [
	super initialize.
	self moduleInstances: Dictionary new
]

{ #category : #accessing }
EMMJinglesPage >> moduleInstanceOf: aComponentClass [
	^ self moduleInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ]
]

{ #category : #accessing }
EMMJinglesPage >> moduleInstances [
	"I return a dictionary with browsers as keys and their instances as value if they were instantiated at least once."

	^ moduleInstances
]

{ #category : #accessing }
EMMJinglesPage >> moduleInstances: aDictionary [
	moduleInstances := aDictionary
]

{ #category : #rendering }
EMMJinglesPage >> renderContentOn: html [
	html render: (self moduleInstanceOf: EMMJingleModule)
]
