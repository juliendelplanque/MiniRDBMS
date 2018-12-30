Class {
	#name : #MSQLAlterTableAddFKConstraint,
	#superclass : #MSQLASTNode,
	#instVars : [
		'tableIdentifier',
		'columnIdentifiers',
		'referencedTableIdentifier'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #accessing }
MSQLAlterTableAddFKConstraint >> columnIdentifiers [
	^ columnIdentifiers
]

{ #category : #accessing }
MSQLAlterTableAddFKConstraint >> columnIdentifiers: anObject [
	columnIdentifiers := anObject
]

{ #category : #accessing }
MSQLAlterTableAddFKConstraint >> referencedTableIdentifier [
	^ referencedTableIdentifier
]

{ #category : #accessing }
MSQLAlterTableAddFKConstraint >> referencedTableIdentifier: anObject [
	referencedTableIdentifier := anObject
]

{ #category : #accessing }
MSQLAlterTableAddFKConstraint >> tableIdentifier [
	^ tableIdentifier
]

{ #category : #accessing }
MSQLAlterTableAddFKConstraint >> tableIdentifier: anObject [
	tableIdentifier := anObject
]
