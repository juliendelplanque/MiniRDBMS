Class {
	#name : #MRDBMSTupleMapperTest,
	#superclass : #TestCase,
	#instVars : [
		'tupleMapper',
		'baseRelationSchema',
		'targetRelationSchema'
	],
	#category : #'MiniRDBMS-Tests'
}

{ #category : #running }
MRDBMSTupleMapperTest >> setUp [
	super setUp.
	baseRelationSchema := MRDBMSRelationSchema new
									addAttributeNamed: 'attribute1' withDomain: MRDBMSDomain integer;
									addAttributeNamed: 'attribute2' withDomain: MRDBMSDomain boolean;
									addAttributeNamed: 'attribute3' withDomain: MRDBMSDomain integer;
									yourself.
	targetRelationSchema := MRDBMSRelationSchema new
									addAttributeNamed: 'attribute3' withDomain: MRDBMSDomain integer;
									addAttributeNamed: 'attribute2' withDomain: MRDBMSDomain boolean;
									addAttributeNamed: 'attribute1' withDomain: MRDBMSDomain integer;
									yourself.
	tupleMapper := MRDBMSTupleMapper baseRelationSchema: baseRelationSchema targetRelationSchema: targetRelationSchema
]

{ #category : #tests }
MRDBMSTupleMapperTest >> testMap [
	self assert: (tupleMapper map: (MRDBMSTuple data: #(1 true 2))) data equals: #(2 true 1)
]

{ #category : #tests }
MRDBMSTupleMapperTest >> testMappingArray [
	self assertCollection: tupleMapper mappingArray equals: #(3 2 1)
]
