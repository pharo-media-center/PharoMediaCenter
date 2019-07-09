"
""Access to the model""
(WAAdmin defaultDispatcher handlerAt: 'Event Music Manager') sessions first model.
""Clear the sessions""
WAAdmin clearSessions
"
Class {
	#name : #EMMSession,
	#superclass : #WASession,
	#instVars : [
		'rootComponent',
		'model',
		'musicPlayer'
	],
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMSession >> defaultMusicPlayer [
	^ EMMMusicPlayer 
]

{ #category : #initialization }
EMMSession >> initialize [
	super initialize.
	^ self model: EMMMusicLibrary new import; musicPlayer: (self defaultMusicPlayer new); yourself
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
EMMSession >> musicPlayer [
	^ musicPlayer
]

{ #category : #accessing }
EMMSession >> musicPlayer: anObject [
	musicPlayer := anObject
]

{ #category : #accessing }
EMMSession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
EMMSession >> rootComponent: aRootComponent [
	rootComponent := aRootComponent
]
