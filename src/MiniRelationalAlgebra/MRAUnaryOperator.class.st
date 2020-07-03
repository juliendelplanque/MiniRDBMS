Class {
	#name : #MRAUnaryOperator,
	#superclass : #MRANode,
	#instVars : [
		'relation'
	],
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #accessing }
MRAUnaryOperator >> relation [
	^ relation
]

{ #category : #accessing }
MRAUnaryOperator >> relation: anObject [
	relation := anObject
]
