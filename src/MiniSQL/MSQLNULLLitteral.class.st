"
I am the NULL litteral.
"
Class {
	#name : #MSQLNULLLitteral,
	#superclass : #MSQLLitteral,
	#category : #'MiniSQL-AST'
}

{ #category : #visiting }
MSQLNULLLitteral >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLNULLLitteral: self
]
