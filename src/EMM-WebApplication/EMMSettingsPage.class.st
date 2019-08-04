Class {
	#name : #EMMSettingsPage,
	#superclass : #EMMPage,
	#category : #'EMM-WebApplication-Pages'
}

{ #category : #accessing }
EMMSettingsPage class >> pageName [
	^ 'Settings'
]

{ #category : #accessing }
EMMSettingsPage class >> priority [
	^ 999
]

{ #category : #rendering }
EMMSettingsPage >> renderContentOn: html [
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
EMMSettingsPage >> settingVideoJingleOn: html [
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
EMMSettingsPage >> settingVideoMainPlayerOn: html [
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
