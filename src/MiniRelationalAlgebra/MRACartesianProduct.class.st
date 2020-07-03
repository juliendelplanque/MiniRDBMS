Class {
	#name : #MRACartesianProduct,
	#superclass : #MRABinaryOperator,
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #visiting }
MRACartesianProduct >> acceptVisitor: aMRAVisitor [
	<generated>
	^ aMRAVisitor visitMRACartesianProduct: self
]
