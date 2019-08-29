"
""Access to the model""
(WAAdmin defaultDispatcher handlerAt: 'Event Music Manager') sessions first model.
""Clear the sessions""
WAAdmin clearSessions
"
Class {
	#name : #PMCSession,
	#superclass : #WASession,
	#instVars : [
		'rootComponent',
		'model',
		'musicPlayer'
	],
	#category : #'PMC-WebApplication-Core'
}

{ #category : #initialization }
PMCSession >> currentPMC [
	| emm |
	PMC allInstancesDo: [ :a | ^ a ].
	emm := PMC new.
	[emm import] on: Error do: [ emm folderImport ].
	^ emm
]

{ #category : #accessing }
PMCSession >> defaultMusicPlayer [
	^ PMCMusicPlayer 
]

{ #category : #initialization }
PMCSession >> initialize [
	| emm | 
	super initialize.
	emm := self currentPMC.
	self model: emm.
	self startSocketFor: emm
]

{ #category : #accessing }
PMCSession >> model [
	^ model
]

{ #category : #accessing }
PMCSession >> model: anObject [
	model := anObject
]

{ #category : #accessing }
PMCSession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
PMCSession >> rootComponent: aRootComponent [
	rootComponent := aRootComponent
]

{ #category : #initialization }
PMCSession >> startSocketFor: emm [
	ZnServer default
		ifNil: [ ZnServer stopDefault.
			ZnServer startDefaultOn: 8041 ].
	ZnServer default delegate prefixMap
		at: 'emm'
		ifAbsent: [ ZnServer default logToTranscript.
			ZnServer default delegate
				map: 'emm'
				to:
					(ZnWebSocketDelegate
						map: 'emm'
						to:
							(PMCWebSocket new
								emm: emm;
								yourself)) ]
]
