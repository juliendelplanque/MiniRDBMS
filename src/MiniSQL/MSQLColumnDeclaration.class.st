Class {
	#name : #MSQLColumnDeclaration,
	#superclass : #MSQLASTNode,
	#instVars : [
		'columnIdentifier',
		'domainIdentifier'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #visiting }
MSQLColumnDeclaration >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLColumnDeclaration: self
]

{ #category : #accessing }
MSQLColumnDeclaration >> columnIdentifier [
	^ columnIdentifier
]

{ #category : #accessing }
MSQLColumnDeclaration >> columnIdentifier: anObject [
	columnIdentifier := anObject
]

{ #category : #accessing }
MSQLColumnDeclaration >> domainIdentifier [
	^ domainIdentifier
]

{ #category : #accessing }
MSQLColumnDeclaration >> domainIdentifier: anObject [
	domainIdentifier := anObject
]
