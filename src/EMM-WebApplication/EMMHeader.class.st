"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : #EMMHeader,
	#superclass : #EMMComponent,
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMHeader >> possiblePages [
	^ EMMPage pagesToDisplay
]

{ #category : #rendering }
EMMHeader >> renderContentOn: html [
	html
		mdlLayoutHeader: [ 
			html
				mdlLayoutHeaderRow: [ 
					html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html
								mdlLayoutTitle: 'Event Music Manager' ].
					html mdlLayoutSpacer.
					html text: 'Version 0.0.0'. ] ].
	self renderDrawerOn: html
]

{ #category : #rendering }
EMMHeader >> renderDrawerOn: html [
	html
		mdlLayoutDrawer: [ 
			html
				mdlNavigation: [ 
					self possiblePages
						do: [ :aClass | 
							html mdlNavigationLink
								beCurrentIf: aClass = self rootComponent componentToDisplay class;
								callback: [ self displayInstanceOf: aClass ];
								with: aClass pageName ] ] ]
]
