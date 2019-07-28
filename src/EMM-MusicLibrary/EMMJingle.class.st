Class {
	#name : #EMMJingle,
	#superclass : #AnObsoleteEMMPlayable,
	#instVars : [
		'name',
		'from',
		'duration'
	],
	#category : #'EMM-MusicLibrary'
}

{ #category : #accessing }
EMMJingle >> duration [
	^ duration
]

{ #category : #accessing }
EMMJingle >> duration: anObject [
	duration := anObject
]

{ #category : #accessing }
EMMJingle >> from [
	^ from
]

{ #category : #accessing }
EMMJingle >> from: anObject [
	from := anObject
]

{ #category : #accessing }
EMMJingle >> name [
	^ name
]

{ #category : #accessing }
EMMJingle >> name: anObject [
	name := anObject
]

{ #category : #playing }
EMMJingle >> play [
	| streaming |
	streaming := StreamingMP3Sound onFileNamed: self path originalString.
	streaming soundPosition: self from / streaming duration seconds.
	streaming play.
	self duration  > 0 seconds
		ifTrue: [ [ self duration wait.
			streaming pause ] forkAt: Processor activePriority + 1 ]
]
