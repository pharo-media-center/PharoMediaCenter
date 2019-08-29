Class {
	#name : #PMCSettingsPage,
	#superclass : #PMCPage,
	#category : #'PMC-WebApplication-Pages'
}

{ #category : #accessing }
PMCSettingsPage class >> pageName [
	^ 'Settings'
]

{ #category : #accessing }
PMCSettingsPage class >> priority [
	^ 999
]

{ #category : #rendering }
PMCSettingsPage >> renderContentOn: html [
	html mdlGrid
		with: [ 
			html mdlCell
				desktopOffset: 3;
				tabletOffset: 3;
				phoneOffset: 0;
				desktopSize: 6;
				tabletSize: 6;
				phoneSize: 12;
				shadow: 2;
				style: 'padding: 10px;';
				with: [ 
					html heading: 'Settings'.
					self settingVideoMainPlayerOn: html.
					self settingVideoJingleOn: html ] ]
]

{ #category : #rendering }
PMCSettingsPage >> settingVideoJingleOn: html [
	html mdlSwitchContainer
						rippleEffect;
						style: 'width: 150px;';
						for: html nextId;
						with: [ html mdlSwitch
								value: self session model jingleWithVideo;
								onClick: (html jQuery ajax callback: [ self session model jingleWithVideo: self session model jingleWithVideo not ]);
								id: html lastId.
							html mdlSwitchLabel: 'Jingle with video' ]
]

{ #category : #rendering }
PMCSettingsPage >> settingVideoMainPlayerOn: html [
	html mdlSwitchContainer
						rippleEffect;
						style: 'width: 150px;';
						for: html nextId;
						with: [ html mdlSwitch
								value: self session model withVideo;
								onClick: (html jQuery ajax callback: [ self session model withVideo: self session model withVideo not ]);
								id: html lastId.
							html mdlSwitchLabel: 'With video' ]
]
