Class {
	#name : #MRDBMSPrimaryKeyConstraintTest,
	#superclass : #TestCase,
	#instVars : [
		'pkConstraint',
		'relation'
	],
	#category : #'MiniRDBMS-Tests'
}

{ #category : #running }
MRDBMSPrimaryKeyConstraintTest >> setUp [
	| relationSchema |
	super setUp.
	pkConstraint := MRDBMSPrimaryKeyConstraint new.
	
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
		insert: (MRDBMSTuple data: #(6 'Thomas'));
		insert: (MRDBMSTuple data: #(7 'Thomas')).
]

{ #category : #tests }
MRDBMSPrimaryKeyConstraintTest >> testCanBeAddedTo [
	pkConstraint
		attributeNames: #('id').
	self assert: (pkConstraint canBeAddedTo: relation)
]

{ #category : #tests }
MRDBMSPrimaryKeyConstraintTest >> testCanBeAddedTo2 [
	pkConstraint
		attributeNames: #('nom').
	self deny: (pkConstraint canBeAddedTo: relation).
]

{ #category : #tests }
MRDBMSPrimaryKeyConstraintTest >> testIsSatisfiedBy [
	pkConstraint
		attributeNames: #('id');
		relation: relation.
	
	self assert: (pkConstraint isSatisfiedBy: (MRDBMSTuple data: #(8 'foo')))
]

{ #category : #tests }
MRDBMSPrimaryKeyConstraintTest >> testIsSatisfiedBy2 [
	pkConstraint
		attributeNames: #('id');
		relation: relation.
	
	self deny: (pkConstraint isSatisfiedBy: (MRDBMSTuple data: #(1 'foo')))
]
