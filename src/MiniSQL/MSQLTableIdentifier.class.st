"
I model an identifier referencing a table.
"
Class {
	#name : #MSQLTableIdentifier,
	#superclass : #MSQLIdentifier,
	#category : #'MiniSQL-AST'
}

{ #category : #visiting }
MSQLTableIdentifier >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLTableIdentifier: self
]
