"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	moduleInstances:		<Object>
	selectedElement:		<Object>


    Implementation Points
"
Class {
	#name : #PMCWAMusicFolders,
	#superclass : #PMCComponent,
	#category : #'PMC-WebApplication-Pages'
}

{ #category : #accessing }
PMCWAMusicFolders class >> pageName [
	^ 'Music'
]

{ #category : #accessing }
PMCWAMusicFolders class >> priority [
	^ 10
]

{ #category : #rendering }
PMCWAMusicFolders >> renderContentOn: html [
	html div
		with:
			((MDLNestedList elements: self session model directories values children: [ :child | #() ])
				format: [ :emmmDirectory | emmmDirectory name ];
				"helpBlock: [ :fileReference | fileReference fullPath fullName ];"
					actionBlock: [ :class | class ];
				yourself)
]
