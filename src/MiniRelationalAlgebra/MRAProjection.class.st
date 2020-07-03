Class {
	#name : #MRAProjection,
	#superclass : #MRAUnaryOperator,
	#instVars : [
		'attributeNames'
	],
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #visiting }
MRAProjection >> acceptVisitor: aMRAVisitor [
	<generated>
	^ aMRAVisitor visitMRAProjection: self
]

{ #category : #accessing }
MRAProjection >> attributeNames [
	^ attributeNames
]

{ #category : #accessing }
MRAProjection >> attributeNames: anObject [
	attributeNames := anObject
]
