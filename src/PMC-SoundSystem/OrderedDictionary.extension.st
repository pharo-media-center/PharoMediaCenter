Extension { #name : #OrderedDictionary }

{ #category : #'*PMC-SoundSystem' }
OrderedDictionary >> at: aKey put: aValue atIndex: index [
	| oldSize |

	oldSize := dictionary size.
	dictionary at: aKey put: aValue.
	dictionary size > oldSize
		ifTrue: [
			orderedKeys size > oldSize
				ifFalse: [self growOrderedKeys].
			orderedKeys at: oldSize + 1 put: aKey].
	^ aValue.
]
