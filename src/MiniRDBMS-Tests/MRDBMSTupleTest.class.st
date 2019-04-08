Class {
	#name : #MRDBMSTupleTest,
	#superclass : #TestCase,
	#instVars : [
		'tuple',
		'relationSchema'
	],
	#category : #'MiniRDBMS-Tests'
}

{ #category : #running }
MRDBMSTupleTest >> setUp [
	super setUp.
	relationSchema := MRDBMSRelationSchema new
							addAttributeNamed: 'nom' withDomain: MRDBMSDomain varchar;
							addAttributeNamed: 'prénom' withDomain: MRDBMSDomain varchar;
							addAttributeNamed: 'age' withDomain: MRDBMSDomain integer;
							yourself.
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
	self assert: (tuple at: 'nom' withSchema: relationSchema) equals: 'Doe'.
	self assert: (tuple at: 'prénom' withSchema: relationSchema) equals: 'John'.
	self assert: (tuple at: 'age' withSchema: relationSchema) equals: 42.
]

{ #category : #tests }
MRDBMSTupleTest >> testProjectOnWithSchema [
	| projected |
	projected := tuple projectOn: #('nom') withSchema: relationSchema.
	
	self assert: projected equals: (MRDBMSTuple data: #('Doe')).
	
	projected := tuple projectOn: #('age' 'prénom') withSchema: relationSchema.
	
	self assert: projected equals: (MRDBMSTuple data: #(42 'John'))
]
