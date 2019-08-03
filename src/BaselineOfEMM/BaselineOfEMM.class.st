Class {
	#name : #BaselineOfEMM,
	#superclass : #BaselineOf,
	#category : #BaselineOfEMM
}

{ #category : #baselines }
BaselineOfEMM >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfEMM >> defineDependencies: spec [
	spec baseline: 'MaterialDesignLite' with: [ spec repository: 'github://DuneSt/MaterialDesignLite:master/src' ].
	spec baseline: 'ID3' with: [ spec repository: 'github://badetitou/id3-pharo:master/repository' ].
	spec
		baseline: 'ZincHTTPComponents'
		with: [ spec
				loads: #('WebSocket');
				repository: 'github://svenvc/zinc:v3.0.1/repository' ].
	spec baseline: 'VLC' with: [ spec repository: 'github://badetitou/Pharo-LibVLC:master/src' ]
]

{ #category : #baselines }
BaselineOfEMM >> defineGroups: spec [
	spec
		group: 'core' with: #('MaterialDesignLite')
]

{ #category : #baselines }
BaselineOfEMM >> definePackages: spec [
	spec
		package: 'EMM' with: [ spec requires: #('EMM-MusicLibrary' 'EMM-SoundSystem') ];
		package: 'EMM-MusicLibrary';
		package: 'EMM-SoundSystem' with: [ spec requires: #('EMM-MusicLibrary' 'VLC') ];
		package: 'EMM-Tests' with: [ spec requires: #('EMM') ];
		package: 'EMM-ImportExport' with: [ spec requires: #('EMM-MusicLibrary') ];
		package: 'EMM-FolderImporter' with: [ spec requires: #('EMM-ImportExport' 'ID3') ];
		package: 'EMM-WebApplication' with: [ spec requires: #('EMM' 'EMM-FolderImporter' 'ZincHTTPComponents') ]
]
