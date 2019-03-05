Class {
	#name : #EMMComponent,
	#superclass : #WAComponent,
	#category : #'EMM-Core'
}

{ #category : #accessing }
EMMComponent >> display: aComponentInstance [
	"Set a component instance as the component to display by the root component."

	self rootComponent componentToDisplay: aComponentInstance
]

{ #category : #accessing }
EMMComponent >> displayInstanceOf: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOf: aComponentClass
]

{ #category : #accessing }
EMMComponent >> rootComponent [
	^ self session rootComponent
]

{ #category : #accessing }
EMMComponent >> version [
	^ self rootComponent version
]
