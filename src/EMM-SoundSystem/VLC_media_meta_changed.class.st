Class {
	#name : #'VLC_media_meta_changed',
	#superclass : #FFIExternalStructure,
	#category : #'EMM-SoundSystem-Structure'
}

{ #category : #'field definition' }
VLC_media_meta_changed class >> fieldsDesc [
	"self rebuildFieldAccessors"
	^ #(
	VLCMetaT meta_type
	)
]
