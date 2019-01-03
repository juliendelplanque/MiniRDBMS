Class {
	#name : #MRDBMSDatabase,
	#superclass : #Object,
	#traits : 'MRDBMSTErrorSignaler',
	#classTraits : 'MRDBMSTErrorSignaler classTrait',
	#instVars : [
		'relations'
	],
	#category : #'MiniRDBMS-Core'
}

{ #category : #adding }
MRDBMSDatabase >> addRelation: aMRDBMSRelation [
	self relations add: aMRDBMSRelation
]

{ #category : #accessing }
MRDBMSDatabase >> allForeignKeys [
	^ self relations
		inject: OrderedCollection new
		into: [ :col :relation |
			col
				addAll: relation fkConstraints;
				yourself ]
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
MRDBMSDatabase >> removeRelation: aMRDBMSRelation [
	(self allForeignKeys anySatisfy: [ :fk | fk referencedRelation = aMRDBMSRelation ])
		ifTrue: [ self error: 'Can not remove relation ', aMRDBMSRelation name , ' one of the column is referenced through a FK constraint.' ].
	
	self relations
		remove: aMRDBMSRelation
]
