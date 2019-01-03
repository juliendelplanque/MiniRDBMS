Class {
	#name : #MSQLTuple,
	#superclass : #MSQLASTNode,
	#instVars : [
		'expressions'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #accessing }
MSQLTuple >> expressions [
	^ expressions
]

{ #category : #accessing }
MSQLTuple >> expressions: anObject [
	expressions := anObject
]
