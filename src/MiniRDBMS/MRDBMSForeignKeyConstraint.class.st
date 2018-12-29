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

{ #category : #accessing }
MRDBMSForeignKeyConstraint >> referencedRelation [
	^ referencedRelation
]

{ #category : #accessing }
MRDBMSForeignKeyConstraint >> referencedRelation: anObject [
	referencedRelation := anObject
]
