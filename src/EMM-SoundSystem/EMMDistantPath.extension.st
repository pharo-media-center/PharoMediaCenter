Extension { #name : #EMMDistantPath }

{ #category : #'*EMM-SoundSystem' }
EMMDistantPath >> createMediaWithVLC: vlc forInstance: anInstance [
	^ vlc mediaFileForInstance: anInstance fromStringLocation: self path
]
