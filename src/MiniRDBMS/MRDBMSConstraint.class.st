Class {
	#name : #MRDBMSConstraint,
	#superclass : #Object,
	#instVars : [
		'relation',
		'attributeNames'
	],
	#category : #'MiniRDBMS-Core'
}

{ #category : #accessing }
MRDBMSConstraint >> attributeNames [
	^ attributeNames
]

{ #category : #accessing }
MRDBMSConstraint >> attributeNames: anObject [
	attributeNames := anObject
]

{ #category : #testing }
MRDBMSConstraint >> canBeAddedTo: aMRDBMSRelation [
	"Returns true if the constraint can be added to aMRDBMSRelation. That is to say if tuples already present in the relation satisfy the constraint."
	^ self subclassResponsibility
]

{ #category : #testing }
MRDBMSConstraint >> isSatisfiedBy: aMRDBMSTuple [
	"Returns true if aMRDBMSTuple satisfies the constraint. Else returns false."
	^ self subclassResponsibility
]

{ #category : #accessing }
MRDBMSConstraint >> relation [
	^ relation
]

{ #category : #accessing }
MRDBMSConstraint >> relation: anObject [
	relation := anObject
]
