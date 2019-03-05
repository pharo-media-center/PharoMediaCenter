Class {
	#name : #EMMFooter,
	#superclass : #EMMComponent,
	#category : #'EMM-Core'
}

{ #category : #rendering }
EMMFooter >> links [
	^ OrderedDictionary
		with: 'Github' -> 'https://github.com/badetitou/EMM'
		with: 'Pharo' -> 'http://pharo.org/'
		with: 'Seaside' -> 'https://github.com/SeasideSt/Seaside'
		with: 'Material Design' -> 'https://material.io/guidelines/'
		with: 'Material Design Lite' -> 'https://getmdl.io/'
]

{ #category : #rendering }
EMMFooter >> renderContentOn: html [
	html
		mdlMiniFooter: [ html
				mdlMiniFooterLeftSection: [ html mdlLogo: 'Event Music Manager'.
					html
						mdlMiniFooterLinkList: [ self links
								keysAndValuesDo: [ :label :url | 
									html
										listItem: [ html anchor
												url: url;
												with: label ] ] ] ].
			html mdlMiniFooterRightSection: [ html mdlMiniFooterLinkList: [ html listItem: [ html text: 'Contact: Benoit Verhaeghe (badetitou@gmail.com)' ] ] ] ]
]
