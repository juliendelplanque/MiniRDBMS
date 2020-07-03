Class {
	#name : #MRABinaryOperator,
	#superclass : #MRANode,
	#instVars : [
		'leftRelation',
		'rightRelation'
	],
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #accessing }
MRABinaryOperator >> leftRelation [
	^ leftRelation
]

{ #category : #accessing }
MRABinaryOperator >> leftRelation: anObject [
	leftRelation := anObject
]

{ #category : #accessing }
MRABinaryOperator >> rightRelation [
	^ rightRelation
]

{ #category : #accessing }
MRABinaryOperator >> rightRelation: anObject [
	rightRelation := anObject
]
