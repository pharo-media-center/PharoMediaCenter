"
Description
--------------------

Abstract superclass of all Seaside components of Event Music Manager. 

I provide some conveniance methods to be used during the redering of the components.
"
Class {
	#name : #EMMComponent,
	#superclass : #WAComponent,
	#category : #'PMC-WebApplication-Core'
}

{ #category : #convenience }
EMMComponent >> display: aComponentInstance [
	"Set a component instance as the component to display by the root component."

	self rootComponent componentToDisplay: aComponentInstance
]

{ #category : #convenience }
EMMComponent >> displayInstanceOf: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOf: aComponentClass
]

{ #category : #accessing }
EMMComponent >> rootComponent [
	^ self session rootComponent
]
