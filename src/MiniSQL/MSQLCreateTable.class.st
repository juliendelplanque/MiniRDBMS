Class {
	#name : #MSQLCreateTable,
	#superclass : #MSQLASTNode,
	#instVars : [
		'tableIdentifier',
		'columnDeclarations'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #accessing }
MSQLCreateTable >> columnDeclarations [
	^ columnDeclarations
]

{ #category : #accessing }
MSQLCreateTable >> columnDeclarations: anObject [
	columnDeclarations := anObject
]

{ #category : #accessing }
MSQLCreateTable >> tableIdentifier [
	^ tableIdentifier
]

{ #category : #accessing }
MSQLCreateTable >> tableIdentifier: anObject [
	tableIdentifier := anObject
]
