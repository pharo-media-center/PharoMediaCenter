Class {
	#name : #MpegLibrary,
	#superclass : #FFILibrary,
	#category : #'EMM-SoundSystem'
}

{ #category : #'accessing platform' }
MpegLibrary >> libraryName [

	 ^ 'Mpeg3Plugin.so'
]

{ #category : #'accessing platform' }
MpegLibrary >> name [
	self ffiCall: 'const char* getModuleName(void)'
]

{ #category : #'accessing platform' }
MpegLibrary >> unix64ModuleName [
	^ self libraryName
]

{ #category : #'accessing platform' }
MpegLibrary >> unixModuleName [
	"Kept for backward compatibility. 
	 Users should use unix32* or unix64*"
	^ self unix64ModuleName
]
