Extension { #name : #EMMMusicLibrary }

{ #category : #'*EMM-FolderImporter' }
EMMMusicLibrary >> import [
	^ EMMFolderImporter new importFrom: self rootFolder in: self
]
