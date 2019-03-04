Class {
	#name : #EMMRoot,
	#superclass : #WAComponent,
	#category : #'EMM-Core'
}

{ #category : #testing }
EMMRoot class >> canBeRoot [
	^ true
]

{ #category : #testing }
EMMRoot class >> initialize [
	^ self initializeAs: 'EMM'
]

{ #category : #testing }
EMMRoot class >> initializeAs: aString [
	self environment at: #WADevelopmentConfiguration ifPresent: [ :class | WAAdmin applicationDefaults removeParent: class instance ].
	^ (WAAdmin register: self asApplicationAt: aString)
		preferenceAt: #sessionClass put: MDLDemoSession;
		addLibrary: JQDeploymentLibrary;
		addLibrary: MDLLibrary;
		addLibrary: MDLDemoLibrary;
		yourself
]

{ #category : #testing }
EMMRoot class >> open [
	<script>
	| port url |
	WAServerManager default adaptors
		ifEmpty: [ (ZnZincServerAdaptor port: (port := 8085)) start ]
		ifNotEmpty: [ :adaptors | 
			adaptors
				detect: #isRunning
				ifFound: [ :anAdaptor | port := anAdaptor server port ]
				ifNone: [ (ZnZincServerAdaptor port: (port := 8085)) start ] ].
	url := 'http://localhost:' , port asString , '/EMM'.
	self flag: #pharo6.
	SystemVersion current major < 7
		ifTrue: [ self class environment
				at: #OSProcess
				ifPresent: [ :class | class command: 'open ' , url ]
				ifAbsent: [ self inform: 'Open ' , url , ' or install OSProcess.' ] ]
		ifFalse: [ WebBrowser openOn: url ]
]

{ #category : #testing }
EMMRoot class >> version [
	^ 'v0.0.1'
]

{ #category : #updating }
EMMRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Event Music Manager'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://storage.googleapis.com/code.getmdl.io/1.3.0/material.deep_purple-pink.min.css').
	anHtmlRoot javascript add: 'hljs.initHighlightingOnLoad();'
]
