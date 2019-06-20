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
	^ (self allSubclasses reject: [ :module | module isAbstract or: [ module priority < 0 ] ]) sorted: #priority ascending
]

{ #category : #accessing }
EMMModule class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
EMMModule >> size [
	^ 4
]
