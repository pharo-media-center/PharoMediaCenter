Extension { #name : #FileReference }

{ #category : #'*EMM-FolderImporter' }
FileReference >> originalString [
	^ String streamContents: [ :stream | filesystem printPath: path on: stream ]
]
