"
I model an identifier referencing a domain.
"
Class {
	#name : #MSQLDomainIdentifier,
	#superclass : #MSQLIdentifier,
	#category : #'MiniSQL-AST'
}

{ #category : #visiting }
MSQLDomainIdentifier >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLDomainIdentifier: self
]
