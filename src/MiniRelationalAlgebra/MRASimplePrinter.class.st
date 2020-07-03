Class {
	#name : #MRASimplePrinter,
	#superclass : #MRAPrinter,
	#category : #'MiniRelationalAlgebra-Visitors'
}

{ #category : #visiting }
MRASimplePrinter >> visitMRAAttributeName: aMRAAttributeName [
	self outputStream nextPutAll: aMRAAttributeName content
]

{ #category : #visiting }
MRASimplePrinter >> visitMRACartesianProduct: aMRACartesianProduct [
	self outputStream nextPutAll: 'CARTESIAN_PRODUCT('.
	self visit: aMRACartesianProduct leftRelation.
	self outputStream nextPut: $,.
	self visit: aMRACartesianProduct rightRelation.
	self outputStream nextPut: $).
]

{ #category : #visiting }
MRASimplePrinter >> visitMRAIntersection: aMRAIntersection [
	self outputStream nextPutAll: 'INTERSECTION('.
	self visit: aMRAIntersection leftRelation.
	self outputStream nextPut: $,.
	self visit: aMRAIntersection rightRelation.
	self outputStream nextPut: $).
]

{ #category : #visiting }
MRASimplePrinter >> visitMRARelationName: aMRARelationName [
	self outputStream nextPutAll: aMRARelationName content
]

{ #category : #visiting }
MRASimplePrinter >> visitMRARename: aMRARename [
	self outputStream nextPutAll: 'RENAME('.
	self visit: aMRARename relation.
	self outputStream nextPut: $,.
	self visit: aMRARename attributeName.
	self outputStream nextPutAll: '->'.
	self visit: aMRARename newName.
	self outputStream nextPut: $).
]

{ #category : #visiting }
MRASimplePrinter >> visitMRAUnion: aMRAUnion [
	self outputStream nextPutAll: 'UNION('.
	self visit: aMRAUnion leftRelation.
	self outputStream nextPut: $,.
	self visit: aMRAUnion rightRelation.
	self outputStream nextPut: $).
]
