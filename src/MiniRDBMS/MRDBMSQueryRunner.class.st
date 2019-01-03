Class {
	#name : #MRDBMSQueryRunner,
	#superclass : #MSQLASTVisitor,
	#instVars : [
		'database'
	],
	#category : #'MiniRDBMS-Running'
}

{ #category : #accessing }
MRDBMSQueryRunner >> database [
	^ database
]

{ #category : #accessing }
MRDBMSQueryRunner >> database: anObject [
	database := anObject
]
