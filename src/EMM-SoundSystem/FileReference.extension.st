Extension { #name : #FileReference }

{ #category : #'*EMM-SoundSystem' }
FileReference >> originalString [
	^ String streamContents: [ :stream | filesystem printPath: path on: stream ]
]
