Class {
	#name : #MRAPredicateFunctionCall,
	#superclass : #MRAPredicateNode,
	#instVars : [
		'functionName',
		'arguments'
	],
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #visiting }
MRAPredicateFunctionCall >> acceptVisitor: aMRAVisitor [
	<generated>
	^ aMRAVisitor visitMRAPredicateFunctionCall: self
]

{ #category : #accessing }
MRAPredicateFunctionCall >> arguments [
	^ arguments
]

{ #category : #accessing }
MRAPredicateFunctionCall >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
MRAPredicateFunctionCall >> functionName [
	^ functionName
]

{ #category : #accessing }
MRAPredicateFunctionCall >> functionName: anObject [
	functionName := anObject
]
