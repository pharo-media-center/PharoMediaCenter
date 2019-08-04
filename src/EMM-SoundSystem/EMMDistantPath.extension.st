Extension { #name : #EMMDistantPath }

{ #category : #'*EMM-SoundSystem' }
EMMDistantPath >> createMediaWithVLC: vlc [
	^ vlc mediaFileFromStringLocation: self path
]
