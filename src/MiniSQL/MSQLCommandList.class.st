Class {
	#name : #MSQLCommandList,
	#superclass : #MSQLASTNode,
	#instVars : [
		'commands'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #visiting }
MSQLCommandList >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLCommandList: self
]

{ #category : #accessing }
MSQLCommandList >> commands [
	^ commands
]

{ #category : #accessing }
MSQLCommandList >> commands: anObject [
	commands := anObject
]
