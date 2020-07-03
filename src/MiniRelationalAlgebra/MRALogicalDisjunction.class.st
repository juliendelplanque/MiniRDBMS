Class {
	#name : #MRALogicalDisjunction,
	#superclass : #MRABinaryPredicateNode,
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #visiting }
MRALogicalDisjunction >> acceptVisitor: aMRAVisitor [
	<generated>
	^ aMRAVisitor visitMRALogicalDisjunction: self
]
