"
Description
--------------------

I am the reader of the application.
"
Class {
	#name : #PMCHeader,
	#superclass : #PMCComponent,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#category : #'PMC-WebApplication-Core'
}

{ #category : #accessing }
PMCHeader >> possiblePages [
	^ PMCPage pagesToDisplay
]

{ #category : #rendering }
PMCHeader >> renderContentOn: html [
	html
		mdlLayoutHeader: [ html
				mdlLayoutHeaderRow: [ html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html mdlLayoutTitle: 'Pharo Media Center' ].
					html mdlLayoutSpacer.

					html mdlAnchorButton
						icon;
						id: html nextId;
						openDialogWithId: self rootDialogOpenId;
						onClickUpdateRootDialogWith: [ :r | self renderDialogCreatePlayableOn: r ];
						with: [ html mdlIcon: 'library_add' ].
					html mdlTooltip
						for: html lastId;
						with: 'Add Playable'.

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

{ #category : #accessing }
PMCHeader >> renderDialogCreatePlayableOn: html [
	| name path |
	html
		form: [ html mdlDialogTitle: 'Create Playable'.
			html
				mdlDialogContent: [ html mdlTextFieldContainer
						floatingLabel;
						with: [ html mdlTextFieldLabel
								for: html nextId;
								with: 'Name'.
							html mdlTextFieldInput
								id: html lastId;
								callback: [ :input | name := input ] ].
					html mdlTextFieldContainer
						floatingLabel;
						with: [ html mdlTextFieldLabel
								for: html nextId;
								with: 'Path'.
							html mdlTextFieldInput
								id: html lastId;
								callback: [ :input | path := input ] ] ].

			html
				mdlDialogActions: [ html mdlButton
						beSubmit;
						callback: [ self session model addSong: (PMCMSong newWithName: name stringPath: path) ];
						with: 'Accept'.
					html mdlButton
						id: self rootDialogCloseId;
						with: 'Cancel' ] ]
]

{ #category : #rendering }
PMCHeader >> renderDrawerOn: html [
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
PMCHeader >> version [
	^ 'v0.5.0'
]
