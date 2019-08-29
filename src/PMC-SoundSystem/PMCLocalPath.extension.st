Extension { #name : #PMCLocalPath }

{ #category : #'*PMC-SoundSystem' }
PMCLocalPath >> createMediaWithVLC: vlc forInstance: anInstance [
	^ vlc mediaFileForInstance: anInstance fromStringPath: self path
]
