Extension { #name : #PMCLocalPath }

{ #category : #'*PMC-SoundSystem' }
PMCLocalPath >> createMediaWithVLC: vlc forInstance: anInstance [
	^ anInstance createMediaFromPath: self path
]
