"
Description
--------------------

I am the root component of Event Music Manager. I will contain every components of the application to display.

I have a header and a footer.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	componentInstances:			<aDictionary>	A dictionary keeping for each component class, an instance. This instance can be use when the user change of page to come pack to a previous page.
	componentToDisplay:		<aComponent>	The current page to display as the root content.
	footer:						<aComponent>	The footer of the page.
	header:						<aComponent>	The header of the page.

"
Class {
	#name : #EMMRoot,
	#superclass : #EMMComponent,
	#traits : 'TRootDialogRenderer',
	#classTraits : 'TRootDialogRenderer classTrait',
	#instVars : [
		'header',
		'componentToDisplay',
		'componentInstances',
		'footer'
	],
	#category : #'EMM-WebApplication-Core'
}

{ #category : #testing }
EMMRoot class >> canBeRoot [
	^ true
]

{ #category : #initialization }
EMMRoot class >> initialize [
		self environment at: #WADevelopmentConfiguration ifPresent: [ :class | WAAdmin applicationDefaults removeParent: class instance ]. "Remove development tools."
	^ (WAAdmin register: self asApplicationAt: 'Event Music Manager')
		preferenceAt: #sessionClass put: EMMSession;
		addLibrary: JQDeploymentLibrary;
		addLibrary: MDLLibrary;
		addLibrary: EMMLibrary;
		yourself
]

{ #category : #'world menu' }
EMMRoot class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Event Music Manager')
		order: 20;
		with: [ (aBuilder item: #'Open in default browser')
				order: 2;
				iconName: #nautilus;
				help: 'Open in the default web browser';
				action: [ self open ] ]
]

{ #category : #'instance creation' }
EMMRoot class >> open [
	<script>
	| port |
	WAServerManager default adaptors
		ifEmpty: [ (ZnZincServerAdaptor port: (port := 8085)) start ]
		ifNotEmpty: [ :adaptors | 
			adaptors
				detect: #isRunning
				ifFound: [ :anAdaptor | port := anAdaptor server port ]
				ifNone: [ (ZnZincServerAdaptor port: (port := 8085)) start ] ].
	WebBrowser openOn: 'http://localhost:' , port asString , '/Event%20Music%20Manager'
]

{ #category : #hooks }
EMMRoot >> children [
	^ { self header. self componentToDisplay. self footer }
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
	"Component instance to display in the application."
	
	^ componentToDisplay
]

{ #category : #accessing }
EMMRoot >> componentToDisplay: aComponent [
	componentToDisplay := aComponent
]

{ #category : #components }
EMMRoot >> defaultFooter [
	^ EMMFooter new
]

{ #category : #components }
EMMRoot >> defaultHeader [
	^ EMMHeader new
]

{ #category : #updating }
EMMRoot >> displayInstanceOf: aComponentClass [
	self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])
]

{ #category : #accessing }
EMMRoot >> footer [
	^ footer
]

{ #category : #accessing }
EMMRoot >> footer: aComponent [
	footer := aComponent
]

{ #category : #accessing }
EMMRoot >> header [
	^ header
]

{ #category : #accessing }
EMMRoot >> header: aComponent [
	header := aComponent
]

{ #category : #hooks }
EMMRoot >> initialRequest: aRequest [
	| consumer pageName |
	super initialRequest: aRequest.
	consumer := self requestContext consumer.
	
	"If we are at end, nothing to manage"
	consumer atEnd ifTrue: [ ^ self ].
	
	pageName := consumer peek asLowercase. "Do not make URLs case sensitive in that case"
	
	"Try to find a page corresponding"
	self header possiblePages
		detect: [ :each | each pathName asLowercase = pageName ]
		ifFound: [ :class | 
			self displayInstanceOf: class.

			"If we find a page, we pop the subpart of the path corresponding to the page."
			consumer next ]
]

{ #category : #initialization }
EMMRoot >> initialize [
	super initialize.
	self header: self defaultHeader.
	self footer: self defaultFooter.
	self session rootComponent: self.
	self componentInstances: Dictionary new.
	self displayInstanceOf: self header possiblePages first
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
								class: 'emmroot';
								size: 12;
								with: [ html render: self componentToDisplay ] ].
					html render: self footer ] ].
	self renderEmptyGenericDialogOn: html
]

{ #category : #updating }
EMMRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Event Music Manager'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'
]

{ #category : #updating }
EMMRoot >> updateUrl: aUrl [
	super updateUrl: aUrl.
	aUrl addToPath: (self componentToDisplay pathName)
]
