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
		project: 'PharoSound'
		with: [ spec
				className: #ConfigurationOfPharoSound;
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main/' ]
]

{ #category : #baselines }
BaselineOfEMM >> defineGroups: spec [
	spec
		group: 'core' with: #('MaterialDesignLite')
]

{ #category : #baselines }
BaselineOfEMM >> definePackages: spec [
	spec
		package: 'EMM-WebApplication' with: [ spec requires: #('EMM' 'EMM-Importer') ];
		package: 'EMM' with: [ spec requires: #('ID3') ];
		package: 'EMM-Importer' with: [ spec requires: #('EMM') ];
		package: 'EMM-SoundSystem' with: [ spec requires: #('PharoSound') ]
]
