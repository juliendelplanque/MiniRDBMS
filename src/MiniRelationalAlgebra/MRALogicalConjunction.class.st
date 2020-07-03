Class {
	#name : #MRALogicalConjunction,
	#superclass : #MRABinaryPredicateNode,
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #visiting }
MRALogicalConjunction >> acceptVisitor: aMRAVisitor [
	<generated>
	^ aMRAVisitor visitMRALogicalConjunction: self
]
