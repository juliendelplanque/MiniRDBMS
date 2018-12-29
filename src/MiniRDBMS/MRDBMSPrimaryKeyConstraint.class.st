Class {
	#name : #MRDBMSPrimaryKeyConstraint,
	#superclass : #MRDBMSConstraint,
	#instVars : [
		'attributeNames'
	],
	#category : #'MiniRDBMS-Core'
}

{ #category : #accessing }
MRDBMSPrimaryKeyConstraint >> attributeNames [
	^ attributeNames
]

{ #category : #accessing }
MRDBMSPrimaryKeyConstraint >> attributeNames: anObject [
	attributeNames := anObject
]

{ #category : #testing }
MRDBMSPrimaryKeyConstraint >> canBeAddedTo: aMRDBMSRelation [
	| relationProjectedOnPK |
	relationProjectedOnPK := (aMRDBMSRelation projectOn: self attributeNames) tuples.
	^ relationProjectedOnPK tuples asSet size = relationProjectedOnPK tuplesCount
]

{ #category : #testing }
MRDBMSPrimaryKeyConstraint >> isSatisfiedBy: aMRDBMSTuple [
	"Returns true if aMRDBMSTuple satisfies the constraint. Else returns false."
	| relationProjectedOnPK |
	relationProjectedOnPK := (self relation projectOn: self attributeNames) tuples.
	^ relationProjectedOnPK tuples asSet size = relationProjectedOnPK tuplesCount
]
