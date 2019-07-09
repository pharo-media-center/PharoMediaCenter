Class {
	#name : #EMMMusicPlayer,
	#superclass : #Object,
	#instVars : [
		'musicList',
		'pointerCurrentMusic'
	],
	#category : #EMM
}

{ #category : #adding }
EMMMusicPlayer >> addAtTheBeginning: aPlayable [
	self shouldBeImplemented
]

{ #category : #adding }
EMMMusicPlayer >> addAtTheEnd: aPlayable [
	self shouldBeImplemented
]

{ #category : #initialization }
EMMMusicPlayer >> initialize [
	super initialize.
	musicList := OrderedCollection new.
]

{ #category : #accessing }
EMMMusicPlayer >> musicList [
	^ musicList
]

{ #category : #accessing }
EMMMusicPlayer >> musicList: aListOfPlayable [
	musicList := OrderedCollection new.
]

{ #category : #control }
EMMMusicPlayer >> next [
	self shouldBeImplemented
]

{ #category : #control }
EMMMusicPlayer >> pause [
	self shouldBeImplemented
]

{ #category : #control }
EMMMusicPlayer >> play [
	self shouldBeImplemented
]

{ #category : #'as yet unclassified' }
EMMMusicPlayer >> playSong: aPlayable [
	^ StreamingMP3Sound onFileNamed: aPlayable path originalString
]

{ #category : #control }
EMMMusicPlayer >> previous [
	self shouldBeImplemented
]
