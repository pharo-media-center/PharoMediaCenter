Class {
	#name : #EMMAnnouncer,
	#superclass : #Announcer,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'EMM-SoundSystem-Announcements'
}

{ #category : #accessing }
EMMAnnouncer class >> uniqueInstance [
	"I'm a singleton…"
	
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]
