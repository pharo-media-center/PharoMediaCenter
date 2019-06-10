"
Description
--------------------

Simple session for the Event Music Manager. I save the root component to help with the application management. Each components will be able to access the root component via myself.

Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	rootComponent:		<aComponent>		The root component of the demo. Should be an instance of the root component of the application.

"
Class {
	#name : #EMMSession,
	#superclass : #WASession,
	#instVars : [
		'rootComponent',
		'model'
	],
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMSession >> initialize [
	super initialize.
	^ self model: EMMModel new import; yourself
]

{ #category : #accessing }
EMMSession >> model [
	^ model
]

{ #category : #accessing }
EMMSession >> model: anObject [
	model := anObject
]

{ #category : #accessing }
EMMSession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
EMMSession >> rootComponent: aRootComponent [
	rootComponent := aRootComponent
]
