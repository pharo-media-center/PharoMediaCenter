Class {
	#name : #PMCVideo,
	#superclass : #PMCComponent,
	#category : #'PMC-WebApplication-Widget'
}

{ #category : #rendering }
PMCVideo >> renderContentOn: html [
	html video
		autoplay: true;
		controls: true;
		width: 420;
		with: [ html source
				url: self videoSource;
				media: self videoType ]
]

{ #category : #rendering }
PMCVideo >> videoSource [
	^ 'http://localhost:8484/vlc_stream.ogg'
	"^ 'http://localhost:8484/vlc_stream.mp4'"
]

{ #category : #rendering }
PMCVideo >> videoType [
	^ 'video/ogg; codecs=theora'
	"^ 'video/mp4'"
]
