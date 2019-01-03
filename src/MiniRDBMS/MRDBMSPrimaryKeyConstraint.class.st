Class {
	#name : #MRDBMSPrimaryKeyConstraint,
	#superclass : #MRDBMSConstraint,
	#category : #'MiniRDBMS-Core'
}

{ #category : #'instance creation' }
MRDBMSPrimaryKeyConstraint class >> attributeNames: aCollectionOfString [
	^ self new
		attributeNames: aCollectionOfString;
		yourself
]

{ #category : #testing }
MRDBMSPrimaryKeyConstraint >> canBeAddedTo: aMRDBMSRelation [
	| relationProjectedOnPK |
	relationProjectedOnPK := aMRDBMSRelation projectOn: self attributeNames.
	^ relationProjectedOnPK tuples asSet size = relationProjectedOnPK tuplesCount
]

{ #category : #testing }
MRDBMSPrimaryKeyConstraint >> isSatisfiedBy: aMRDBMSTuple [
	"Returns true if aMRDBMSTuple satisfies the constraint. Else returns false."
	| projectedTuple |
	projectedTuple := aMRDBMSTuple projectOn: self attributeNames withSchema: self relation relationSchema.
	^ (self relation projectOn: self attributeNames) tuples
		noneSatisfy: [ :t | t = projectedTuple ]
]

{ #category : #printing }
MRDBMSPrimaryKeyConstraint >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self attributeNames
		do: [ :att | aStream nextPutAll: att ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $).
]
