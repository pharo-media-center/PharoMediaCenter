Extension { #name : #FileReference }

{ #category : #'*EMM' }
FileReference >> originalString [
	^ String streamContents: [ :stream | filesystem printPath: path on: stream ]
]
