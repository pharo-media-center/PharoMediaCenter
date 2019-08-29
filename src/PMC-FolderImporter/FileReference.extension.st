Extension { #name : #FileReference }

{ #category : #'*PMC-FolderImporter' }
FileReference >> originalString [
	^ String streamContents: [ :stream | filesystem printPath: path on: stream ]
]
