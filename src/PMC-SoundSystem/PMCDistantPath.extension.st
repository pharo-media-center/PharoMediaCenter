Extension { #name : #PMCDistantPath }

{ #category : #'*PMC-SoundSystem' }
PMCDistantPath >> createMediaWithVLC: vlc forInstance: anInstance [
	^ anInstance createMediaFromLocation: self path
]
