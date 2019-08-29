Class {
	#name : #PMCModule,
	#superclass : #EMMComponent,
	#category : #'PMC-WebApplication-Core'
}

{ #category : #testing }
PMCModule class >> isAbstract [
	^ self = PMCModule
]

{ #category : #accessing }
PMCModule class >> modulesToDisplay [
	^ (self allSubclasses reject: [ :module | module isAbstract or: [ module priority < 0 ] ]) sorted: #priority ascending
]

{ #category : #accessing }
PMCModule class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
PMCModule >> size [
	^ 4
]
