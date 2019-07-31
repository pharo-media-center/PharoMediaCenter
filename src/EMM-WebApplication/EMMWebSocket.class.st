"
ZnServer stopDefault.
ZnServer startDefaultOn: 8041.
ZnServer default logToTranscript.
ZnServer default delegate
   map: 'emm'
   to: (ZnWebSocketDelegate map: 'emm' to: EMMWebSocketDelegate new).
"
Class {
	#name : #EMMWebSocket,
	#superclass : #Object,
	#instVars : [
		'emm'
	],
	#category : #'EMM-WebApplication-WebSocket'
}

{ #category : #accessing }
EMMWebSocket >> emm [
	^ emm
]

{ #category : #accessing }
EMMWebSocket >> emm: anObject [
	emm := anObject
]

{ #category : #initialization }
EMMWebSocket >> initialize [
	super initialize.
]

{ #category : #initialization }
EMMWebSocket >> value: webSocket [
	"I stream status messages to a WebSocket client, once every second 
	until ConnectionClosed or no longer isConnected"
	self emm ifNotNil: [ webSocket sendMessage:( emm currentPlayable ifNil: [ 'No Sound' ] ifNotNil: [:sound | sound title]) ] ifNil: [ webSocket sendMessage: 'EMM Not Connected' ] 
]
