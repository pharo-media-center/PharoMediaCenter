"
Description
--------------------

I am an abstract component. My subclasses represent the main pages of the application.

Each page should have a name that will be used in the URLs and a priority for the menus.
"
Class {
	#name : #EMMPage,
	#superclass : #EMMComponent,
	#category : #'EMM-WebApplication-Core'
}

{ #category : #testing }
EMMPage class >> isAbstract [
	^ self = EMMPage
]

{ #category : #accessing }
EMMPage class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
EMMPage class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
EMMPage class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
EMMPage class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
EMMPage >> pathName [
	^ self class pathName
]
