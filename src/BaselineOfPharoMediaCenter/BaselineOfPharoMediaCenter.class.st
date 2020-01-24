Class {
	#name : #BaselineOfPharoMediaCenter,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoMediaCenter
}

{ #category : #baselines }
BaselineOfPharoMediaCenter >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfPharoMediaCenter >> defineDependencies: spec [
	spec baseline: 'MaterialDesignLite' with: [ spec repository: 'github://DuneSt/MaterialDesignLite:master/src' ].
	spec
		baseline: 'ZincHTTPComponents'
		with: [ spec
				loads: #('WebSocket');
				repository: 'github://svenvc/zinc:v3.0.1/repository' ].
	spec baseline: 'VLC' with: [ spec repository: 'github://badetitou/Pharo-LibVLC:master/src' ]
]

{ #category : #baselines }
BaselineOfPharoMediaCenter >> defineGroups: spec [
	spec
		group: 'core' with: #('MaterialDesignLite')
]

{ #category : #baselines }
BaselineOfPharoMediaCenter >> definePackages: spec [
	spec
		package: 'PMC' with: [ spec requires: #('PMC-MusicLibrary' 'PMC-SoundSystem') ];
		package: 'PMC-MusicLibrary';
		package: 'PMC-SoundSystem' with: [ spec requires: #('PMC-MusicLibrary' 'VLC') ];
		package: 'PMC-Tests' with: [ spec requires: #('PMC') ];
		package: 'PMC-ImportExport' with: [ spec requires: #('PMC-MusicLibrary') ];
		package: 'PMC-FolderImporter' with: [ spec requires: #('PMC-ImportExport') ];
		package: 'PMC-WebApplication' with: [ spec requires: #('PMC' 'PMC-FolderImporter' 'ZincHTTPComponents') ]
]
