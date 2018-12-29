Class {
	#name : #MRDBMSRelationTest,
	#superclass : #TestCase,
	#instVars : [
		'relation',
		'relation2',
		'relationBis'
	],
	#category : #'MiniRDBMS-Tests'
}

{ #category : #running }
MRDBMSRelationTest >> setUp [
	|relationSchema|
	super setUp.
	relationSchema := MRDBMSRelationSchema new
							addAttributeNamed: 'id' withDomain: MRDBMSDomain integer;
							addAttributeNamed: 'nom' withDomain: MRDBMSDomain varchar;
							yourself.
	relation := MRDBMSRelation named: 'personne' relationSchema: relationSchema.
	
	relation
		insert: (MRDBMSTuple data: #(1 'Donna'));
		insert: (MRDBMSTuple data: #(2 'Jason'));
		insert: (MRDBMSTuple data: #(3 'Carl'));
		insert: (MRDBMSTuple data: #(4 'Robert'));
		insert: (MRDBMSTuple data: #(5 'Angelina'));
		insert: (MRDBMSTuple data: #(6 'Thomas')).
	
	relationSchema := MRDBMSRelationSchema new
							addAttributeNamed: 'id' withDomain: MRDBMSDomain integer;
							addAttributeNamed: 'nom' withDomain: MRDBMSDomain varchar;
							yourself.
	relationBis := MRDBMSRelation named: 'personneBis' relationSchema: relationSchema.
	
	relationBis
		insert: (MRDBMSTuple data: #(1 'Donna'));
		insert: (MRDBMSTuple data: #(2 'Jason'));
		insert: (MRDBMSTuple data: #(5 'Angelina'));
		insert: (MRDBMSTuple data: #(6 'Thomas'));
		insert: (MRDBMSTuple data: #(7 'Edward'));
		insert: (MRDBMSTuple data: #(8 'Michael')).
	
	relationSchema := MRDBMSRelationSchema new
							addAttributeNamed: 'nom_chien' withDomain: MRDBMSDomain varchar;
							addAttributeNamed: 'maitre' withDomain: MRDBMSDomain integer;
							yourself.
	relation2 := MRDBMSRelation named: 'chien' relationSchema: relationSchema.
	relation2
		insert: (MRDBMSTuple data: #('Jack' 1));
		insert: (MRDBMSTuple data: #('Bill' 3));
		insert: (MRDBMSTuple data: #('Camel' 3))
]

{ #category : #tests }
MRDBMSRelationTest >> testCartesianProduct [
	| result expected expectedRelationSchema |
	expected := {
		MRDBMSTuple data: #(1 'Donna' 'Jack' 1).
		MRDBMSTuple data: #(1 'Donna' 'Bill' 3).
		MRDBMSTuple data: #(1 'Donna' 'Camel' 3).
		MRDBMSTuple data: #(2 'Jason' 'Jack' 1).
		MRDBMSTuple data: #(2 'Jason' 'Bill' 3).
		MRDBMSTuple data: #(2 'Jason' 'Camel' 3).
		MRDBMSTuple data: #(3 'Carl' 'Jack' 1).
		MRDBMSTuple data: #(3 'Carl' 'Bill' 3).
		MRDBMSTuple data: #(3 'Carl' 'Camel' 3).
		MRDBMSTuple data: #(4 'Robert' 'Jack' 1).
		MRDBMSTuple data: #(4 'Robert' 'Bill' 3).
		MRDBMSTuple data: #(4 'Robert' 'Camel' 3).
		MRDBMSTuple data: #(5 'Angelina' 'Jack' 1).
		MRDBMSTuple data: #(5 'Angelina' 'Bill' 3).
		MRDBMSTuple data: #(5 'Angelina' 'Camel' 3).
		MRDBMSTuple data: #(6 'Thomas' 'Jack' 1).
		MRDBMSTuple data: #(6 'Thomas' 'Bill' 3).
		MRDBMSTuple data: #(6 'Thomas' 'Camel' 3).
	}.
	expectedRelationSchema := MRDBMSRelationSchema new
										addAttributeNamed: 'id' withDomain: MRDBMSDomain integer;
										addAttributeNamed: 'nom' withDomain: MRDBMSDomain varchar;
										addAttributeNamed: 'nom_chien' withDomain: MRDBMSDomain varchar;
										addAttributeNamed: 'maitre' withDomain: MRDBMSDomain integer;
										yourself.
	result := relation cartesianProduct: relation2.
	self assert: result relationSchema equals: expectedRelationSchema.
	self assert: result tuples size equals: 6*3.
	self assertCollection: result tuples hasSameElements: expected
]

{ #category : #tests }
MRDBMSRelationTest >> testDifference [
	| result expected |
	expected := {
		MRDBMSTuple data: #(3 'Carl').
		MRDBMSTuple data: #(4 'Robert').
	}.
	result := relation difference: relationBis.
	self assert: result relationSchema equals: relation relationSchema.
	self assert: result relationSchema equals: relationBis relationSchema.
	self assert: result tuples size equals: 2.
	self assertCollection: result tuples hasSameElements: expected
]

{ #category : #tests }
MRDBMSRelationTest >> testDifference2 [
	| result expected |
	expected := {
		MRDBMSTuple data: #(7 'Edward').
		MRDBMSTuple data: #(8 'Michael')
	}.
	result := relationBis difference: relation.
	self assert: result relationSchema equals: relation relationSchema.
	self assert: result relationSchema equals: relationBis relationSchema.
	self assert: result tuples size equals: 2.
	self assertCollection: result tuples hasSameElements: expected
]

{ #category : #tests }
MRDBMSRelationTest >> testProjectOn [
	| result expected expectedSchema |
	expected := {
		MRDBMSTuple data: #(1).
		MRDBMSTuple data: #(2).
		MRDBMSTuple data: #(3).
		MRDBMSTuple data: #(4).
		MRDBMSTuple data: #(5).
		MRDBMSTuple data: #(6).
	}.
	expectedSchema := MRDBMSRelationSchema new
							addAttributeNamed: 'id' withDomain: MRDBMSDomain integer;
							yourself.
	result := relation projectOn: #('id').
	self assert: result relationSchema equals: expectedSchema.
	self assert: result tuples size equals: 6.
	self assertCollection: result tuples hasSameElements: expected
]

{ #category : #tests }
MRDBMSRelationTest >> testProjectOn2 [
	| result expected expectedSchema |
	expected := {
		MRDBMSTuple data: #('Donna').
		MRDBMSTuple data: #('Jason').
		MRDBMSTuple data: #('Carl').
		MRDBMSTuple data: #('Robert').
		MRDBMSTuple data: #('Angelina').
		MRDBMSTuple data: #('Thomas').
	}.
	expectedSchema := MRDBMSRelationSchema new
							addAttributeNamed: 'nom' withDomain: MRDBMSDomain varchar;
							yourself.
	result := relation projectOn: #('nom').
	self assert: result relationSchema equals: expectedSchema.
	self assert: result tuples size equals: 6.
	self assertCollection: result tuples hasSameElements: expected
]

{ #category : #tests }
MRDBMSRelationTest >> testProjectOn3 [
	| result expected expectedSchema |
	expected := {
		MRDBMSTuple data: #('Donna' 1).
		MRDBMSTuple data: #('Jason' 2).
		MRDBMSTuple data: #('Carl' 3).
		MRDBMSTuple data: #('Robert' 4).
		MRDBMSTuple data: #('Angelina' 5).
		MRDBMSTuple data: #('Thomas' 6).
	}.
	expectedSchema := MRDBMSRelationSchema new
							addAttributeNamed: 'nom' withDomain: MRDBMSDomain varchar;
							addAttributeNamed: 'id' withDomain: MRDBMSDomain integer;
							yourself.
	result := relation projectOn: #('nom' 'id').
	self assert: result relationSchema equals: expectedSchema.
	self assert: result tuples size equals: 6.
	self assertCollection: result tuples hasSameElements: expected
]

{ #category : #tests }
MRDBMSRelationTest >> testRenameTo [
	| result expected expectedSchema |
	expected := {
		MRDBMSTuple data: #(1 'Donna').
		MRDBMSTuple data: #(2 'Jason').
		MRDBMSTuple data: #(3 'Carl').
		MRDBMSTuple data: #(4 'Robert').
		MRDBMSTuple data: #(5 'Angelina').
		MRDBMSTuple data: #(6 'Thomas').
	}.
	expectedSchema := MRDBMSRelationSchema new
							addAttributeNamed: 'id' withDomain: MRDBMSDomain integer;
							addAttributeNamed: 'name' withDomain: MRDBMSDomain varchar;
							yourself.
	result := relation rename: 'nom' to: 'name'.
	self assert: result relationSchema equals: expectedSchema.
	self assert: result tuples size equals: 6.
	self assertCollection: result tuples hasSameElements: expected
]

{ #category : #tests }
MRDBMSRelationTest >> testRenameTo2 [
	| result expected expectedSchema |
	expected := {
		MRDBMSTuple data: #(1 'Donna').
		MRDBMSTuple data: #(2 'Jason').
		MRDBMSTuple data: #(3 'Carl').
		MRDBMSTuple data: #(4 'Robert').
		MRDBMSTuple data: #(5 'Angelina').
		MRDBMSTuple data: #(6 'Thomas').
	}.
	expectedSchema := MRDBMSRelationSchema new
							addAttributeNamed: 'identifiant' withDomain: MRDBMSDomain integer;
							addAttributeNamed: 'nom' withDomain: MRDBMSDomain varchar;
							yourself.
	result := relation rename: 'id' to: 'identifiant'.
	self assert: result relationSchema equals: expectedSchema.
	self assert: result tuples size equals: 6.
	self assertCollection: result tuples hasSameElements: expected
]

{ #category : #tests }
MRDBMSRelationTest >> testSelect [
	| result expected |
	expected := {
		MRDBMSTuple data: #(4 'Robert').
		MRDBMSTuple data: #(5 'Angelina').
		MRDBMSTuple data: #(6 'Thomas').
	}.
	result := relation select: [ :relationSchema :tuple | (tuple at: 'id' withSchema: relationSchema) > 3 ].
	self assert: result relationSchema equals: relation relationSchema.
	self assert: result tuples size equals: 3.
	self assertCollection: result tuples hasSameElements: expected
]

{ #category : #tests }
MRDBMSRelationTest >> testSelect2 [
	| result expected |
	expected := {
		MRDBMSTuple data: #(1 'Donna').
		MRDBMSTuple data: #(3 'Carl').
		MRDBMSTuple data: #(5 'Angelina').
	}.
	result := relation select: [ :relationSchema :tuple | (tuple at: 'id' withSchema: relationSchema) odd ].
	self assert: result relationSchema equals: relation relationSchema.
	self assert: result tuples size equals: 3.
	self assertCollection: result tuples hasSameElements: expected
]

{ #category : #tests }
MRDBMSRelationTest >> testSelect3 [
	| result expected |
	expected := {
		MRDBMSTuple data: #(1 'Donna').
		MRDBMSTuple data: #(5 'Angelina').
	}.
	result := relation select: [ :relationSchema :tuple | (tuple at: 'nom' withSchema: relationSchema) endsWith: 'a' ].
	self assert: result relationSchema equals: relation relationSchema.
	self assert: result tuples size equals: 2.
	self assertCollection: result tuples hasSameElements: expected
]

{ #category : #tests }
MRDBMSRelationTest >> testUnion [
	| result expected |
	expected := {
		MRDBMSTuple data: #(1 'Donna').
		MRDBMSTuple data: #(2 'Jason').
		MRDBMSTuple data: #(3 'Carl').
		MRDBMSTuple data: #(4 'Robert').
		MRDBMSTuple data: #(5 'Angelina').
		MRDBMSTuple data: #(6 'Thomas').
		MRDBMSTuple data: #(7 'Edward').
		MRDBMSTuple data: #(8 'Michael')
	}.
	result := relation union: relationBis.
	self assert: result relationSchema equals: relation relationSchema.
	self assert: result relationSchema equals: relationBis relationSchema.
	self assert: result tuples size equals: 8.
	self assertCollection: result tuples hasSameElements: expected
]
