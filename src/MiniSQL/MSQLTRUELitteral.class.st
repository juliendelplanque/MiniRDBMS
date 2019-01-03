"
I am the TRUE litteral.
"
Class {
	#name : #MSQLTRUELitteral,
	#superclass : #MSQLLitteral,
	#category : #'MiniSQL-AST'
}

{ #category : #visiting }
MSQLTRUELitteral >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLTRUELitteral: self
]
