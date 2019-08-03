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
		mdlLayoutHeader: [ html
				mdlLayoutHeaderRow: [ html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html mdlLayoutTitle: 'Event Music Manager' ].
					html mdlLayoutSpacer.
					html mdlAnchorButton
						icon;
						id: html nextId;
						callback: [ self session model import ];
						with: [ html mdlIcon: 'cloud_download' ].
					html mdlTooltip
						for: html lastId;
						with: 'Import'.
					html mdlAnchorButton
						icon;
						id: html nextId;
						callback: [ self session model export ];
						with: [ html mdlIcon: 'cloud_upload' ].
					html mdlTooltip
						for: html lastId;
						with: 'Export'.


					html text: 'Version ' , self version ] ].
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

{ #category : #rendering }
EMMHeader >> version [
	^ 'v0.2.0'
]
