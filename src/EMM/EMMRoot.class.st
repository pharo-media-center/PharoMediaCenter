Class {
	#name : #EMMRoot,
	#superclass : #EMMComponent,
	#instVars : [
		'header',
		'footer',
		'componentToDisplay',
		'componentInstances'
	],
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

{ #category : #accessing }
EMMRoot >> componentInstances [
	^ componentInstances
]

{ #category : #accessing }
EMMRoot >> componentInstances: anObject [
	componentInstances := anObject
]

{ #category : #accessing }
EMMRoot >> componentToDisplay [
	^ componentToDisplay
]

{ #category : #accessing }
EMMRoot >> componentToDisplay: anObject [
	componentToDisplay := anObject
]

{ #category : #components }
EMMRoot >> defaultFooter [
	^ EMMFooter new
]

{ #category : #components }
EMMRoot >> defaultHeader [
	^ EMMHeader new
]

{ #category : #rendering }
EMMRoot >> displayInstanceOf: aComponentClass [
	self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])
]

{ #category : #accessing }
EMMRoot >> footer [
	^ footer
]

{ #category : #accessing }
EMMRoot >> footer: anObject [
	footer := anObject
]

{ #category : #accessing }
EMMRoot >> header [
	^ header
]

{ #category : #accessing }
EMMRoot >> header: anObject [
	header := anObject
]

{ #category : #initialization }
EMMRoot >> initialize [
	super initialize.
	self header: self defaultHeader.
	self footer: self defaultFooter.
	self session rootComponent: self.
	self componentInstances: Dictionary new.
	self displayInstanceOf: EMMModules allSubclasses first
]

{ #category : #rendering }
EMMRoot >> renderContentOn: html [
	html
		mdlLayout: [ html render: self header.
			html mdlLayoutContent
				class: 'mdl-color-text--grey-600';
				with: [ html mdlGrid
						noSpacing;
						with: [ html mdlCell
								class: 'mdl-components';
								size: 12;
								with: [  html render: self componentToDisplay ] ].
					html render: self footer ] ]
]

{ #category : #updating }
EMMRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Event Music Manager'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://code.getmdl.io/1.3.0/material.deep_orange-blue.min.css').
	anHtmlRoot javascript add: 'hljs.initHighlightingOnLoad();'
]
