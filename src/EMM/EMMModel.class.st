Class {
	#name : #EMMModel,
	#superclass : #Object,
	#instVars : [
		'settings',
		'songs',
		'directories'
	],
	#category : #EMM
}

{ #category : #accessing }
EMMModel >> directories [
	^ directories
]

{ #category : #initialization }
EMMModel >> import [
	^ EMMLibraryImporter new importFromFolder: self rootFolder
]

{ #category : #initialization }
EMMModel >> initialize [
	self settings: EMMMSettings new.
	songs := Set new.
	directories := Dictionary new
]

{ #category : #accessing }
EMMModel >> rootFolder [
	^ self settings rootFolder
]

{ #category : #accessing }
EMMModel >> settings [
	^ settings
]

{ #category : #accessing }
EMMModel >> settings: anObject [
	settings := anObject
]

{ #category : #accessing }
EMMModel >> songs [
	^ songs
]
