Class {
	#name : #MRASelection,
	#superclass : #MRAUnaryOperator,
	#instVars : [
		'predicate'
	],
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #visiting }
MRASelection >> acceptVisitor: aMRAVisitor [
	<generated>
	^ aMRAVisitor visitMRASelection: self
]

{ #category : #accessing }
MRASelection >> predicate [
	^ predicate
]

{ #category : #accessing }
MRASelection >> predicate: anObject [
	predicate := anObject
]
