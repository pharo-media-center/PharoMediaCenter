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
	#category : #'EMM-WebApplication-WebSocket'
}

{ #category : #initialization }
EMMWebSocket >> initialize [
	super initialize.
]

{ #category : #initialization }
EMMWebSocket >> value: webSocket [
	"I stream status messages to a WebSocket client, once every second 
	until ConnectionClosed or no longer isConnected"
	webSocket sendMessage: 'Hello Bade'
]
