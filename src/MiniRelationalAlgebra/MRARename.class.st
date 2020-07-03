Class {
	#name : #MRARename,
	#superclass : #MRAUnaryOperator,
	#instVars : [
		'attributeName',
		'newName'
	],
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #visiting }
MRARename >> acceptVisitor: aMRAVisitor [
	<generated>
	^ aMRAVisitor visitMRARename: self
]

{ #category : #accessing }
MRARename >> attributeName [
	^ attributeName
]

{ #category : #accessing }
MRARename >> attributeName: anObject [
	attributeName := anObject
]

{ #category : #accessing }
MRARename >> newName [
	^ newName
]

{ #category : #accessing }
MRARename >> newName: anObject [
	newName := anObject
]
