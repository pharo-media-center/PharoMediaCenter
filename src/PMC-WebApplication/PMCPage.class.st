"
Description
--------------------

I am an abstract component. My subclasses represent the main pages of the application.

Each page should have a name that will be used in the URLs and a priority for the menus.
"
Class {
	#name : #PMCPage,
	#superclass : #PMCComponent,
	#category : #'PMC-WebApplication-Core'
}

{ #category : #testing }
PMCPage class >> isAbstract [
	^ self = PMCPage
]

{ #category : #accessing }
PMCPage class >> pageName [
	"Title of the page that will be used in menus and URLs."

	^ self subclassResponsibility
]

{ #category : #accessing }
PMCPage class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: #priority ascending
]

{ #category : #accessing }
PMCPage class >> pathName [
	"Use to define the URL name"

	^ self pageName copyWithout: $  
]

{ #category : #accessing }
PMCPage class >> priority [
	^ self subclassResponsibility
]

{ #category : #accessing }
PMCPage >> pathName [
	^ self class pathName
]
