"
ZnServer stopDefault.
ZnServer startDefaultOn: 8041.
ZnServer default logToTranscript.
ZnServer default delegate
   map: 'emm'
   to: (ZnWebSocketDelegate map: 'emm' to: EMMWebSocketDelegate new).
"
Class {
	#name : #PMCWebSocket,
	#superclass : #Object,
	#instVars : [
		'emm'
	],
	#category : #'PMC-WebApplication-WebSocket'
}

{ #category : #accessing }
PMCWebSocket >> emm [
	^ emm
]

{ #category : #accessing }
PMCWebSocket >> emm: anObject [
	emm := anObject
]

{ #category : #initialization }
PMCWebSocket >> initialize [
	super initialize.
]

{ #category : #initialization }
PMCWebSocket >> value: webSocket [
	"I stream status messages to a WebSocket client, once every second 
	until ConnectionClosed or no longer isConnected"

	[ [ self emm
		ifNotNil: [ webSocket sendMessage: (emm currentPlayable ifNil: [ 'No Sound' ] ifNotNil: [ :sound | sound title ifNil: [ sound name ] ]) ]
		ifNil: [ webSocket sendMessage: 'EMM Not Connected' ].
	1 second asDelay wait.
	webSocket isConnected ] repeat ]
		on: NetworkError
		do: [ self crTrace: 'Ignoring connection close' ]
]
