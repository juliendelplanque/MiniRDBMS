Class {
	#name : #MSQLInsertQuery,
	#superclass : #MSQLASTNode,
	#instVars : [
		'tableIdentifier',
		'columnIdentifiers',
		'tuples'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #visiting }
MSQLInsertQuery >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLInsertQuery: self
]

{ #category : #accessing }
MSQLInsertQuery >> columnIdentifiers [
	^ columnIdentifiers
]

{ #category : #accessing }
MSQLInsertQuery >> columnIdentifiers: anObject [
	columnIdentifiers := anObject
]

{ #category : #accessing }
MSQLInsertQuery >> tableIdentifier [
	^ tableIdentifier
]

{ #category : #accessing }
MSQLInsertQuery >> tableIdentifier: anObject [
	tableIdentifier := anObject
]

{ #category : #accessing }
MSQLInsertQuery >> tuples [
	^ tuples
]

{ #category : #accessing }
MSQLInsertQuery >> tuples: anObject [
	tuples := anObject
]
