Class {
	#name : #MSQLDropTable,
	#superclass : #MSQLASTNode,
	#instVars : [
		'tableIdentifier'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #visiting }
MSQLDropTable >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLDropTable: self
]

{ #category : #accessing }
MSQLDropTable >> tableIdentifier [
	^ tableIdentifier
]

{ #category : #accessing }
MSQLDropTable >> tableIdentifier: anObject [
	tableIdentifier := anObject
]
