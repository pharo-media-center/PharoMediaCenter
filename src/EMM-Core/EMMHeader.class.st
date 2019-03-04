Class {
	#name : #EMMHeader,
	#superclass : #MDLDemoComponent,
	#instVars : [
		'activeTab'
	],
	#category : #'EMM-Core'
}

{ #category : #accessing }
EMMHeader >> possiblePages [
	^ { }
]

{ #category : #rendering }
EMMHeader >> renderContentOn: html [
	html
				mdlLayoutHeader: [ html
						mdlLayoutHeaderRow: [ html mdlLayoutTitle: 'Event Music Manager'.
							html mdlLayoutSpacer ] ].
			html
				mdlLayoutDrawer: [ html mdlLayoutTitle: 'Pages'.
					html
						mdlNavigation: [ 1 to: 5 do: [ :i | 
								html mdlNavigationLink
									beCurrentIf: [ i = 1 ];
									with: 'Link' ] ] ]
]
