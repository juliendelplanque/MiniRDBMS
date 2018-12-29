Class {
	#name : #MRDBMSRelation,
	#superclass : #Object,
	#traits : 'MRDBMSTErrorSignaler',
	#classTraits : 'MRDBMSTErrorSignaler classTrait',
	#instVars : [
		'name',
		'relationSchema',
		'tuples',
		'constraints'
	],
	#category : #'MiniRDBMS-Core'
}

{ #category : #'instance creation' }
MRDBMSRelation class >> named: aString relationSchema: aMRDBMSRelationSchema [
	^ self new
		name: aString;
		relationSchema: aMRDBMSRelationSchema;
		yourself
]

{ #category : #'relational algebra' }
MRDBMSRelation >> cartesianProduct: aMRDBMSRelation [
	|newRelationSchema|
	(self relationSchema attributeNames noneSatisfy: [ :attributeName |
		aMRDBMSRelation relationSchema attributeNames includes: attributeName ])
			ifFalse: [ self error: 'Relation schemas of the two relations should be disjoint to perform cartesian product operator.' ].
	
	newRelationSchema := MRDBMSRelationSchema new.
	self relationSchema attributeNamesAndDomainsDo: [ :attributeName :domain |
		newRelationSchema addAttributeNamed: attributeName withDomain: domain ].
	aMRDBMSRelation relationSchema attributeNamesAndDomainsDo: [ :attributeName :domain |
		newRelationSchema addAttributeNamed: attributeName withDomain: domain ].
	^ self class new
		relationSchema: newRelationSchema;
		tuples: (Array streamContents: [ :stream | 
			self tuples do: [ :t1 |
				aMRDBMSRelation tuples do: [ :t2 |
					stream nextPut: (MRDBMSTuple data: t1 data , t2 data) ] ] ]);
		yourself
]

{ #category : #accessing }
MRDBMSRelation >> constraints [
	^ constraints
]

{ #category : #accessing }
MRDBMSRelation >> constraints: anObject [
	constraints := anObject
]

{ #category : #'relational algebra' }
MRDBMSRelation >> difference: aMRDBMSRelation [
	self relationSchema = aMRDBMSRelation relationSchema
		ifFalse: [ self error: 'Relation schema should be identical to perform difference operator.' ].
	
	^ self class new
		relationSchema: self relationSchema copy;
		tuples: (self tuples difference: aMRDBMSRelation tuples);
		yourself
]

{ #category : #initialization }
MRDBMSRelation >> initialize [
	super initialize.
	self tuples: OrderedCollection new
]

{ #category : #'tuples management' }
MRDBMSRelation >> insert: aRDBMSTuple [
	(self relationSchema isConformTuple: aRDBMSTuple)
		ifFalse: [ self error: 'Invalid tuple, can not be inserted in the relation.' ].
		
	self flag: #TODO. "When constraints will be implemented, we should check that aRDBMSTuple does not violate one of the constraints here."
		
	self tuples
		add: aRDBMSTuple
]

{ #category : #accessing }
MRDBMSRelation >> name [
	^ name
]

{ #category : #private }
MRDBMSRelation >> name: anObject [
	name := anObject
]

{ #category : #'relational algebra' }
MRDBMSRelation >> projectOn: anArrayOfAttributeNames [
	"Implements the projection operator as defined in relational algebra."
	| newRelationSchema |
	(self relationSchema attributeNames includesAll: anArrayOfAttributeNames asSet)
		ifFalse: [ self error: 'Can not project on attributes that are not part of the relation schema.' ].
	newRelationSchema := MRDBMSRelationSchema new.
	anArrayOfAttributeNames do: [ :attName |
		newRelationSchema addAttributeNamed: attName withDomain: (self relationSchema domainOf: attName) ].
	^ self class new
		relationSchema: newRelationSchema;
		tuples: (self tuples collect: [ :t |
			MRDBMSTuple
				data:(newRelationSchema attributeNames collect: [ :attName |
							t at: attName withSchema: self relationSchema ]) ]);
		yourself
]

{ #category : #private }
MRDBMSRelation >> relationSchema [
	^ relationSchema
]

{ #category : #private }
MRDBMSRelation >> relationSchema: anObject [
	relationSchema := anObject
]

{ #category : #'relational algebra' }
MRDBMSRelation >> rename: attributeName to: newAttributeName [
	| newRelationSchema indexToReplace i |
	newRelationSchema := MRDBMSRelationSchema new.
	indexToReplace := self relationSchema indexOfAttributeNamed: attributeName.
	i := 1.
	self relationSchema attributeNamesAndDomainsDo: [ :attName :domain |
		i = indexToReplace
			ifTrue: [ newRelationSchema addAttributeNamed: newAttributeName withDomain: domain ]
			ifFalse: [ newRelationSchema addAttributeNamed: attName withDomain: domain ].
		i := i + 1 ].
	^ self class new
		relationSchema: newRelationSchema;
		tuples: self tuples;
		yourself
]

{ #category : #'relational algebra' }
MRDBMSRelation >> select: aBlockWithTwoArgs [
	"Implements the selection operation as defined in relational algebra.
	 aBlockWithTwoArgs models the propositional formula used to select tuples.
	 The first arg of the block is the relation schema and the second arg is the tuple.
	 The block should answer true for selected tuples and false for not-selected tuples."
	^ self class new
		relationSchema: self relationSchema copy;
		tuples: (self tuples select: [ :t |
			aBlockWithTwoArgs value: self relationSchema value: t ]);
		yourself
]

{ #category : #private }
MRDBMSRelation >> tuples [
	^ tuples
]

{ #category : #private }
MRDBMSRelation >> tuples: anObject [
	tuples := anObject
]

{ #category : #accessing }
MRDBMSRelation >> tuplesCount [
	^ self tuples size
]

{ #category : #'relational algebra' }
MRDBMSRelation >> union: aMRDBMSRelation [
	self relationSchema = aMRDBMSRelation relationSchema
		ifFalse: [ self error: 'Relation schema should be identical to perform union operator.' ].
	
	^ self class new
		relationSchema: self relationSchema copy;
		tuples: (self tuples union: aMRDBMSRelation tuples);
		yourself
]
