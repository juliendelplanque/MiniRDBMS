Class {
	#name : #MSQLSelectQuery,
	#superclass : #MSQLASTNode,
	#instVars : [
		'selectClause',
		'fromClause',
		'whereClause',
		'setOperationClause'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #accessing }
MSQLSelectQuery >> fromClause [
	^ fromClause
]

{ #category : #accessing }
MSQLSelectQuery >> fromClause: anObject [
	fromClause := anObject
]

{ #category : #accessing }
MSQLSelectQuery >> selectClause [
	^ selectClause
]

{ #category : #accessing }
MSQLSelectQuery >> selectClause: anObject [
	selectClause := anObject
]

{ #category : #accessing }
MSQLSelectQuery >> setOperationClause [
	^ setOperationClause
]

{ #category : #accessing }
MSQLSelectQuery >> setOperationClause: anObject [
	setOperationClause := anObject
]

{ #category : #accessing }
MSQLSelectQuery >> whereClause [
	^ whereClause
]

{ #category : #accessing }
MSQLSelectQuery >> whereClause: anObject [
	whereClause := anObject
]
