"
I model a foreign key constraint applied on a relation.

I only store the #referencedRelation because I consider that the primary key of this relation has the right attributes for my #attributeNames to refer to them.
"
Class {
	#name : #MRDBMSForeignKeyConstraint,
	#superclass : #MRDBMSConstraint,
	#instVars : [
		'referencedRelation'
	],
	#category : #'MiniRDBMS-Core'
}

{ #category : #testing }
MRDBMSForeignKeyConstraint >> canBeAddedTo: aMRDBMSRelation [
	| referencedRelationProjectedOnPK candidateRelationProjectedOnFK |
	self referencedRelation hasPrimaryKey
		ifFalse: [ ^ false ].
	
	referencedRelationProjectedOnPK := self referencedRelation projectOn: self referencedRelation pkConstraint attributeNames.
	candidateRelationProjectedOnFK := aMRDBMSRelation projectOn: self attributeNames.
	^ candidateRelationProjectedOnFK tuples allSatisfy: [ :tupleFromFK |
		referencedRelationProjectedOnPK tuples anySatisfy: [ :tupleFromPK |
			tupleFromFK = tupleFromPK ] ]
]

{ #category : #testing }
MRDBMSForeignKeyConstraint >> isSatisfiedBy: aMRDBMSTuple [
	| referencedRelationProjectedOnPK candidateTupleProjectedOnFK |
	referencedRelationProjectedOnPK := self referencedRelation projectOn: self referencedRelation pkConstraint attributeNames.
	candidateTupleProjectedOnFK := aMRDBMSTuple projectOn: self attributeNames withSchema: self relation relationSchema.
	^ referencedRelationProjectedOnPK tuples anySatisfy: [ :any |
		any = candidateTupleProjectedOnFK ]
]

{ #category : #printing }
MRDBMSForeignKeyConstraint >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self attributeNames
		do: [ :att | aStream nextPutAll: att ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream
		nextPutAll: ' REFERENCES ';
		nextPutAll: self referencedRelation name.
	aStream nextPut: $).
]

{ #category : #accessing }
MRDBMSForeignKeyConstraint >> referencedRelation [
	^ referencedRelation
]

{ #category : #accessing }
MRDBMSForeignKeyConstraint >> referencedRelation: anObject [
	referencedRelation := anObject
]
