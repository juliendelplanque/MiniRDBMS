Class {
	#name : #MSQLASTNode,
	#superclass : #Object,
	#category : #'MiniSQL-AST'
}

{ #category : #visiting }
MSQLASTNode >> acceptVisitor: aMSQLASTVisitor [
	^ self subclassResponsibility
]
