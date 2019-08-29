"
Description
--------------------

A footer for the application with all the useful links.
"
Class {
	#name : #PMCFooter,
	#superclass : #PMCComponent,
	#category : #'PMC-WebApplication-Core'
}

{ #category : #accessing }
PMCFooter >> links [
	^ OrderedDictionary
		with: 'MDL for Seaside' -> 'https://github.com/DuneSt/MaterialDesignLite'
		with: 'Pharo' -> 'http://pharo.org/'
		with: 'Seaside' -> 'https://github.com/SeasideSt/Seaside'
]

{ #category : #rendering }
PMCFooter >> renderContentOn: html [
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
			html mdlMiniFooterRightSection: [ html mdlMiniFooterLinkList: [ html listItem: [ html text: 'Contact: badetitou@gmail.com' ] ] ] ]
]
