Class {
	#name : #MSQLAlterTableAddPKConstraint,
	#superclass : #MSQLASTNode,
	#instVars : [
		'tableIdentifier',
		'columnIdentifiers'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #visiting }
MSQLAlterTableAddPKConstraint >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLAlterTableAddPKConstraint: self
]

{ #category : #accessing }
MSQLAlterTableAddPKConstraint >> columnIdentifiers [
	^ columnIdentifiers
]

{ #category : #accessing }
MSQLAlterTableAddPKConstraint >> columnIdentifiers: anObject [
	columnIdentifiers := anObject
]

{ #category : #accessing }
MSQLAlterTableAddPKConstraint >> tableIdentifier [
	^ tableIdentifier
]

{ #category : #accessing }
MSQLAlterTableAddPKConstraint >> tableIdentifier: anObject [
	tableIdentifier := anObject
]
