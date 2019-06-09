Class {
	#name : #EMMModule,
	#superclass : #EMMComponent,
	#category : #'EMM-WebApplication-Core'
}

{ #category : #testing }
EMMModule class >> isAbstract [
	^ self = EMMModule
]

{ #category : #accessing }
EMMModule class >> modulesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
EMMModule class >> priority [
	^ self subclassResponsibility
]
