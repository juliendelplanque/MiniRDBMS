Class {
	#name : #MRDBMSTupleTest,
	#superclass : #TestCase,
	#instVars : [
		'tuple'
	],
	#category : #'MiniRDBMS-Tests'
}

{ #category : #running }
MRDBMSTupleTest >> setUp [
	super setUp.
	tuple := MRDBMSTuple data: #('Doe' 'John' 42)
]

{ #category : #tests }
MRDBMSTupleTest >> testAtIndex [
	self assert: (tuple atIndex: 1) equals: 'Doe'.
	self assert: (tuple atIndex: 2) equals: 'John'.
	self assert: (tuple atIndex: 3) equals: 42.
]

{ #category : #tests }
MRDBMSTupleTest >> testAtWithSchema [
	| relationSchema |
	relationSchema := MRDBMSRelationSchema new
							addAttributeNamed: 'nom' withDomain: MRDBMSDomain varchar;
							addAttributeNamed: 'prénom' withDomain: MRDBMSDomain varchar;
							addAttributeNamed: 'age' withDomain: MRDBMSDomain integer;
							yourself.
	self assert: (tuple at: 'nom' withSchema: relationSchema) equals: 'Doe'.
	self assert: (tuple at: 'prénom' withSchema: relationSchema) equals: 'John'.
	self assert: (tuple at: 'age' withSchema: relationSchema) equals: 42.
]
