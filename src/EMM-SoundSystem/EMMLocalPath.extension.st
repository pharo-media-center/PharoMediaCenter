Extension { #name : #EMMLocalPath }

{ #category : #'*EMM-SoundSystem' }
EMMLocalPath >> createMediaWithVLC: vlc forInstance: anInstance [
	^ vlc mediaFileForInstance: anInstance fromStringPath: self path
]
