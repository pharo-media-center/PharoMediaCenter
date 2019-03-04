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
	spec
    baseline: 'MaterialDesignLite'
    with: [ spec repository: 'github://DuneSt/MaterialDesignLite:master/src' ]
]

{ #category : #baselines }
BaselineOfEMM >> defineGroups: spec [
	spec
		group: 'core' with: #('MaterialDesignLite')
]

{ #category : #baselines }
BaselineOfEMM >> definePackages: spec [
	spec
		repository: 'https://github.com/badetitou/EMM';
		package: 'BaselineOfEMM';
		package: 'EMM'
]
