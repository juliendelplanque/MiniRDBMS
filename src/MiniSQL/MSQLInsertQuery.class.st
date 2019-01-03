Class {
	#name : #MSQLInsertQuery,
	#superclass : #MSQLASTNode,
	#instVars : [
		'tableIdentifier',
		'columnIdentifiers'
	],
	#category : #'MiniSQL-AST'
}

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
