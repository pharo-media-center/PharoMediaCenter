Extension { #name : #EMMLocalPath }

{ #category : #'*EMM-SoundSystem' }
EMMLocalPath >> createMediaWithVLC: vlc [
	^ vlc mediaFileFromStringPath: self path
]
