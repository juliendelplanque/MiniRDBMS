Class {
	#name : #MRDBMSRelationSchemaTest,
	#superclass : #TestCase,
	#instVars : [
		'relationSchema'
	],
	#category : #'MiniRDBMS-Tests'
}

{ #category : #running }
MRDBMSRelationSchemaTest >> setUp [
	super setUp.
	relationSchema := MRDBMSRelationSchema new
							addAttributeNamed: 'nom' withDomain: MRDBMSDomain varchar;
							addAttributeNamed: 'prénom' withDomain: MRDBMSDomain varchar;
							addAttributeNamed: 'age' withDomain: MRDBMSDomain integer;
							yourself
]

{ #category : #tests }
MRDBMSRelationSchemaTest >> testAddAttributeNamedWithDomain [
	self assert: (relationSchema attributesToDomains size) equals: 3.
	relationSchema
		addAttributeNamed: 'poids' withDomain: MRDBMSDomain integer.
	self assert: (relationSchema attributesToDomains size) equals: 4.
]

{ #category : #tests }
MRDBMSRelationSchemaTest >> testAttributeNames [
	self assert: relationSchema attributeNames equals: #('nom' 'prénom' 'age')
]

{ #category : #tests }
MRDBMSRelationSchemaTest >> testDomains [
	self assert: relationSchema domains equals: relationSchema attributesToDomains values
]

{ #category : #tests }
MRDBMSRelationSchemaTest >> testIndexOfAttributeNamed [
	self assert: (relationSchema indexOfAttributeNamed: 'nom') equals: 1.
	self assert: (relationSchema indexOfAttributeNamed: 'prénom') equals: 2.
	self assert: (relationSchema indexOfAttributeNamed: 'age') equals: 3.
]

{ #category : #tests }
MRDBMSRelationSchemaTest >> testInitialize [
	| newInstance |
	newInstance := MRDBMSRelationSchema new.
	
	self assert: newInstance attributesToDomains class equals: OrderedDictionary.
	self assert: newInstance attributesToDomains size equals: 0.
]

{ #category : #tests }
MRDBMSRelationSchemaTest >> testIsConformTuple [
	self assert: (relationSchema isConformTuple: (MRDBMSTuple data: #('foo' 'bar' 2))).
	
	self deny: (relationSchema isConformTuple: (MRDBMSTuple data: #(1 'bar' 2))).
	
	self deny: (relationSchema isConformTuple: (MRDBMSTuple data: #(1 2 'hello'))).
	
	self deny: (relationSchema isConformTuple: (MRDBMSTuple data: #('foo' 'bar' 2.3))).
]
