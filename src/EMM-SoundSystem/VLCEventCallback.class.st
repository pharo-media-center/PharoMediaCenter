Class {
	#name : #VLCEventCallback,
	#superclass : #FFICallback,
	#classInstVars : [
		'halt'
	],
	#category : #'EMM-SoundSystem-Library'
}

{ #category : #'instance creation' }
VLCEventCallback class >> fnSpec [
	^ 'void (const VLCEvent_t * p_event, void *p_data)'
]

{ #category : #'instance creation' }
VLCEventCallback class >> on: aBlock [
	^ self signature: self fnSpec block: aBlock
]
