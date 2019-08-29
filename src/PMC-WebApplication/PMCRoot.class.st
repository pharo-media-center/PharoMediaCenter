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
	#name : #PMCRoot,
	#superclass : #EMMComponent,
	#traits : 'TRootDialogRenderer',
	#classTraits : 'TRootDialogRenderer classTrait',
	#instVars : [
		'header',
		'componentToDisplay',
		'componentInstances',
		'footer'
	],
	#category : #'PMC-WebApplication-Core'
}

{ #category : #testing }
PMCRoot class >> canBeRoot [
	^ true
]

{ #category : #initialization }
PMCRoot class >> initialize [
		self environment at: #WADevelopmentConfiguration ifPresent: [ :class | WAAdmin applicationDefaults removeParent: class instance ]. "Remove development tools."
	^ (WAAdmin register: self asApplicationAt: 'Pharo Media Center')
		preferenceAt: #sessionClass put: PMCSession;
		addLibrary: JQDeploymentLibrary;
		addLibrary: MDLLibrary;
		addLibrary: PMCLibrary;
		yourself
]

{ #category : #'world menu' }
PMCRoot class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Pharo Media Center')
		order: 20;
		with: [ (aBuilder item: #'Open in default browser')
				order: 2;
				iconName: #nautilus;
				help: 'Open in the default web browser';
				action: [ self open ] ]
]

{ #category : #'instance creation' }
PMCRoot class >> open [
	<script>
	| port |
	WAServerManager default adaptors
		ifEmpty: [ (ZnZincServerAdaptor port: (port := 8085)) start ]
		ifNotEmpty: [ :adaptors | 
			adaptors
				detect: #isRunning
				ifFound: [ :anAdaptor | port := anAdaptor server port ]
				ifNone: [ (ZnZincServerAdaptor port: (port := 8085)) start ] ].
	WebBrowser openOn: 'http://localhost:' , port asString , '/Pharo%20Media%20Center'
]

{ #category : #hooks }
PMCRoot >> children [
	^ { self header. self componentToDisplay. self footer }
]

{ #category : #accessing }
PMCRoot >> componentInstances [
	^ componentInstances
]

{ #category : #accessing }
PMCRoot >> componentInstances: anObject [
	componentInstances := anObject
]

{ #category : #accessing }
PMCRoot >> componentToDisplay [
	"Component instance to display in the application."
	
	^ componentToDisplay
]

{ #category : #accessing }
PMCRoot >> componentToDisplay: aComponent [
	componentToDisplay := aComponent
]

{ #category : #components }
PMCRoot >> defaultFooter [
	^ PMCFooter new
]

{ #category : #components }
PMCRoot >> defaultHeader [
	^ PMCHeader new
]

{ #category : #updating }
PMCRoot >> displayInstanceOf: aComponentClass [
	self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])
]

{ #category : #accessing }
PMCRoot >> footer [
	^ footer
]

{ #category : #accessing }
PMCRoot >> footer: aComponent [
	footer := aComponent
]

{ #category : #accessing }
PMCRoot >> header [
	^ header
]

{ #category : #accessing }
PMCRoot >> header: aComponent [
	header := aComponent
]

{ #category : #hooks }
PMCRoot >> initialRequest: aRequest [
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
PMCRoot >> initialize [
	super initialize.
	self header: self defaultHeader.
	self footer: self defaultFooter.
	self session rootComponent: self.
	self componentInstances: Dictionary new.
	self displayInstanceOf: self header possiblePages first
]

{ #category : #rendering }
PMCRoot >> renderContentOn: html [
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
PMCRoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Event Music Manager'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'
]

{ #category : #updating }
PMCRoot >> updateUrl: aUrl [
	super updateUrl: aUrl.
	aUrl addToPath: (self componentToDisplay pathName)
]
