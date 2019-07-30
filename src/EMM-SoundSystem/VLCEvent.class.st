Class {
	#name : #VLCEvent,
	#superclass : #FFICallback,
	#classInstVars : [
		'halt'
	],
	#category : #'EMM-SoundSystem-Library'
}

{ #category : #initialization }
VLCEvent >> initialize [
	super initialize.
	self signature: 'typedef void(* libvlc_callback_t) (const struct libvlc_event_t *p_event, void *p_data)' block: [ :event :data | 1 halt ]
]
