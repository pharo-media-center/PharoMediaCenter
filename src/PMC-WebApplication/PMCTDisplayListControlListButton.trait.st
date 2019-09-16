Trait {
	#name : #PMCTDisplayListControlListButton,
	#category : #'PMC-WebApplication'
}

{ #category : #'as yet unclassified' }
PMCTDisplayListControlListButton >> controlListButtonID [
	^ #controlListButtonID
]

{ #category : #'as yet unclassified' }
PMCTDisplayListControlListButton >> renderControlListButtonOn: html [
	html mdlButton
		onClick: (html jQuery ajax callback: [ self session model previous ]);
		icon;
		with: [ html mdlIcon: 'skip_previous' ].
	self session model isPlaying
		ifTrue: [ html mdlButton
				onClick:
					((html jQuery id: self controlListButtonID) load
						html: [ :canvas | 
							self session model pause.
							self renderControlListButtonOn: canvas ]);
				icon;
				with: [ html mdlIcon: 'pause_circle_filled' ] ]
		ifFalse: [ html mdlButton
				onClick:
					((html jQuery id: self controlListButtonID) load
						html: [ :canvas | 
							self session model play.
							self renderControlListButtonOn: canvas ]);
				icon;
				with: [ html mdlIcon: 'play_circle_filled' ] ].

	html mdlButton
		onClick: (html jQuery ajax callback: [ self session model next ]);
		icon;
		with: [ html mdlIcon: 'skip_next' ]
]
