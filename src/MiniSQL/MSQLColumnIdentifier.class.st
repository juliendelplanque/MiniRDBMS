"
I model an identifier referencing a column.
"
Class {
	#name : #MSQLColumnIdentifier,
	#superclass : #MSQLIdentifier,
	#category : #'MiniSQL-AST'
}

{ #category : #visiting }
MSQLColumnIdentifier >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLColumnIdentifier: self
]
