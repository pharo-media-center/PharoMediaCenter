Class {
	#name : #EMMModel,
	#superclass : #Object,
	#instVars : [
		'settings'
	],
	#category : #EMM
}

{ #category : #initialization }
EMMModel >> initialize [
	self settings: EMMMSettings new
]

{ #category : #accessing }
EMMModel >> settings [
	^ settings
]

{ #category : #accessing }
EMMModel >> settings: anObject [
	settings := anObject
]
