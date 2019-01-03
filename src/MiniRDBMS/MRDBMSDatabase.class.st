Class {
	#name : #MRDBMSDatabase,
	#superclass : #Object,
	#instVars : [
		'relations'
	],
	#category : #'MiniRDBMS-Core'
}

{ #category : #running }
MRDBMSDatabase >> execute: aSQLString [
	"Execute aSQLString on myself."
	| queryAST |
	queryAST := MSQLParser parse: aSQLString.
	queryAST runOn: self
]

{ #category : #accessing }
MRDBMSDatabase >> relations [
	^ relations
]
