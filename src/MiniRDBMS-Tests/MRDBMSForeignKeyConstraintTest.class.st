Class {
	#name : #MRDBMSForeignKeyConstraintTest,
	#superclass : #TestCase,
	#instVars : [
		'fkConstraint',
		'relation',
		'relation2'
	],
	#category : #'MiniRDBMS-Tests'
}

{ #category : #running }
MRDBMSForeignKeyConstraintTest >> setUp [
	| relationSchema |
	super setUp.
	fkConstraint := MRDBMSForeignKeyConstraint new.
	
	relationSchema := MRDBMSRelationSchema new
							addAttributeNamed: 'id' withDomain: MRDBMSDomain integer;
							addAttributeNamed: 'nom' withDomain: MRDBMSDomain varchar;
							yourself.
	relation := MRDBMSRelation named: 'personne' relationSchema: relationSchema.
	
	relation pkConstraint: (MRDBMSPrimaryKeyConstraint attributeNames:#('id')).
	
	relation
		insert: (MRDBMSTuple data: #(1 'Donna'));
		insert: (MRDBMSTuple data: #(2 'Jason'));
		insert: (MRDBMSTuple data: #(3 'Carl'));
		insert: (MRDBMSTuple data: #(4 'Robert'));
		insert: (MRDBMSTuple data: #(5 'Angelina'));
		insert: (MRDBMSTuple data: #(6 'Thomas')).
		
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
MRDBMSForeignKeyConstraintTest >> testCanBeAddedTo [
	fkConstraint
		attributeNames: #('maitre');
		referencedRelation: relation.
		
	self assert: (fkConstraint canBeAddedTo: relation2)
]

{ #category : #tests }
MRDBMSForeignKeyConstraintTest >> testCanBeAddedTo2 [
	fkConstraint
		attributeNames: #('maitre');
		referencedRelation: relation.
	
	relation2
		insert: (MRDBMSTuple data: #('foo' 0)).
	
	self deny: (fkConstraint canBeAddedTo: relation2)
]

{ #category : #tests }
MRDBMSForeignKeyConstraintTest >> testIsSatisfiedBy [
	fkConstraint
		attributeNames: #('maitre');
		referencedRelation: relation;
		relation: relation2.
		
	self assert: (fkConstraint isSatisfiedBy: (MRDBMSTuple data: #('foo' 1)))
]

{ #category : #tests }
MRDBMSForeignKeyConstraintTest >> testIsSatisfiedBy2 [
	fkConstraint
		attributeNames: #('maitre');
		referencedRelation: relation;
		relation: relation2.
		
	self deny: (fkConstraint isSatisfiedBy: (MRDBMSTuple data: #('foo' 0)))
]
