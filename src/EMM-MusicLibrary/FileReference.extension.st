Extension { #name : #FileReference }

{ #category : #'*EMM-MusicLibrary' }
FileReference >> originalString [
	^ String streamContents: [ :stream | filesystem printPath: path on: stream ]
]
