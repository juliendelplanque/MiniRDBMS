Class {
	#name : #MRABinaryPredicateNode,
	#superclass : #MRAPredicateNode,
	#instVars : [
		'leftPredicate',
		'rightPredicate'
	],
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #accessing }
MRABinaryPredicateNode >> leftPredicate [
	^ leftPredicate
]

{ #category : #accessing }
MRABinaryPredicateNode >> leftPredicate: anObject [
	leftPredicate := anObject
]

{ #category : #accessing }
MRABinaryPredicateNode >> rightPredicate [
	^ rightPredicate
]

{ #category : #accessing }
MRABinaryPredicateNode >> rightPredicate: anObject [
	rightPredicate := anObject
]
