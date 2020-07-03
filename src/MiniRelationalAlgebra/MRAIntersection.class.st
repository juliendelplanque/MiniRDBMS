Class {
	#name : #MRAIntersection,
	#superclass : #MRABinaryOperator,
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #visiting }
MRAIntersection >> acceptVisitor: aMRAVisitor [
	<generated>
	^ aMRAVisitor visitMRAIntersection: self
]
