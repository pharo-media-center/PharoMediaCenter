Class {
	#name : #EMMHeader,
	#superclass : #MDLDemoComponent,
	#instVars : [
		'activeTab'
	],
	#category : #'EMM-Core'
}

{ #category : #accessing }
EMMHeader >> possibleModules [
	^ EMMModules allSubclasses
]

{ #category : #rendering }
EMMHeader >> renderContentOn: html [
	html
		mdlLayoutHeader: [ html
				mdlLayoutHeaderRow: [ html mdlLayoutTitle: 'Event Music Manager'.
					html mdlLayoutSpacer ] ].
	html
		mdlLayoutDrawer: [ html mdlLayoutTitle: 'Modules'.
			html
				mdlNavigation: [ self possibleModules do: [ :module | 
						html mdlNavigationLink
							with: module title ] ] ]
]
