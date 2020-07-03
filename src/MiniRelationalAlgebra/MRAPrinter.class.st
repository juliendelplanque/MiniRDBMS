Class {
	#name : #MRAPrinter,
	#superclass : #MRAVisitor,
	#instVars : [
		'outputStream'
	],
	#category : #'MiniRelationalAlgebra-Visitors'
}

{ #category : #accessing }
MRAPrinter >> outputStream [
	^ outputStream
]

{ #category : #accessing }
MRAPrinter >> outputStream: anObject [
	outputStream := anObject
]
