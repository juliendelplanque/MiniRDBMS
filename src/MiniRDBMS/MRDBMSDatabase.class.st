Class {
	#name : #MRDBMSDatabase,
	#superclass : #Object,
	#instVars : [
		'relations'
	],
	#category : #'MiniRDBMS-Core'
}

{ #category : #adding }
MRDBMSDatabase >> addRelation: aMRDBMSRelation [
	self relations add: aMRDBMSRelation
]

{ #category : #running }
MRDBMSDatabase >> execute: aSQLString [
	"Execute aSQLString on myself."
	| queryAST |
	queryAST := MSQLParser parse: aSQLString.
	queryAST runOn: self
]

{ #category : #initialization }
MRDBMSDatabase >> initialize [
	super initialize.
	relations := OrderedCollection new
]

{ #category : #accessing }
MRDBMSDatabase >> relations [
	^ relations
]

{ #category : #removing }
MRDBMSDatabase >> removeRelationNamed: aMRDBMSRelation [
	self flag: #TODO. "Should check FK constraints before removing a table."
	self relations
		remove: aMRDBMSRelation
]
