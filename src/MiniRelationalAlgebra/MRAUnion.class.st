Class {
	#name : #MRAUnion,
	#superclass : #MRABinaryOperator,
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #visiting }
MRAUnion >> acceptVisitor: aMRAVisitor [
	<generated>
	^ aMRAVisitor visitMRAUnion: self
]
