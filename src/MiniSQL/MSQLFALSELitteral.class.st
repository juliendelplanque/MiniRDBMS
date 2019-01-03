"
I am the FALSE litteral.
"
Class {
	#name : #MSQLFALSELitteral,
	#superclass : #MSQLLitteral,
	#category : #'MiniSQL-AST'
}

{ #category : #visiting }
MSQLFALSELitteral >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLFALSELitteral: self
]
