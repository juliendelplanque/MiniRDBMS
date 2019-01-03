Class {
	#name : #MRDBMSRelationAlreadyExistsError,
	#superclass : #MRDBMSError,
	#instVars : [
		'tableName'
	],
	#category : #'MiniRDBMS-Errors'
}

{ #category : #signalling }
MRDBMSRelationAlreadyExistsError class >> signalRelation: tableName [
	self new
		tableName: tableName;
		signal
]

{ #category : #accessing }
MRDBMSRelationAlreadyExistsError >> tableName [
	^ tableName
]

{ #category : #accessing }
MRDBMSRelationAlreadyExistsError >> tableName: anObject [
	tableName := anObject
]
