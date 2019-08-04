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

{ #category : #initialization }
EMMSession >> currentEMM [
	| emm |
	EMM allInstancesDo: [ :a | ^ a ].
	emm := EMM new.
	[emm import] on: Error do: [ emm folderImport ].
	^ emm
]

{ #category : #accessing }
EMMSession >> defaultMusicPlayer [
	^ EMMMusicPlayer 
]

{ #category : #initialization }
EMMSession >> initialize [
	| emm | 
	super initialize.
	emm := self currentEMM.
	self model: emm.
	self startSocketFor: emm
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

{ #category : #initialization }
EMMSession >> startSocketFor: emm [
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
							(EMMWebSocket new
								emm: emm;
								yourself)) ]
]
