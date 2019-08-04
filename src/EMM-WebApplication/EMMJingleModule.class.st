Class {
	#name : #EMMJingleModule,
	#superclass : #EMMModule,
	#traits : 'TWithRootDialogComponent',
	#classTraits : 'TWithRootDialogComponent classTrait',
	#category : #'EMM-WebApplication-Core'
}

{ #category : #accessing }
EMMJingleModule class >> priority [
	^ 3
]

{ #category : #rendering }
EMMJingleModule >> renderContentOn: html [
	html div
		style: 'position: relative; height: 100%';
		shadow: 2;
		with: [ html mdlGrid
				style: 'height: 96%';
				with: [ self session model jingles
						do: [ :jingle | 
							html mdlCell
								size: 3;
								with: [ html mdlAnchorButton
										callback: [ self session model playJingle: jingle ];
										primaryColor;
										with: jingle name.
									html mdlAnchorButton
										callback: [ self session model removeJingle: jingle ];
										with: [ html mdlIcon: 'delete_forever' ] ] ] ].
			html mdlButton
				style: 'z-index: 10; position: absolute; top: 10px; right: 10px;';
				raised;
				fab;
				colored;
				openDialogWithId: self rootDialogOpenId;
				onClickUpdateRootDialogWith: [ :r | self renderCreateJingleOn: r ];
				with: '+' ]
]

{ #category : #rendering }
EMMJingleModule >> renderCreateJingleOn: html [
	| name path |
	html
		form: [ html mdlDialogTitle: 'Create Jingle'.
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
						callback: [ self session model addJingle: (EMMJingle newWithName: name stringPath: path) ];
						with: 'Accept'.
					html mdlButton
						id: self rootDialogCloseId;
						with: 'Cancel' ] ]
]
