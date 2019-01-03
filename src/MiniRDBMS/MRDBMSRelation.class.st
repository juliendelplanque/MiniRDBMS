Class {
	#name : #MRDBMSRelation,
	#superclass : #Object,
	#traits : 'MRDBMSTErrorSignaler',
	#classTraits : 'MRDBMSTErrorSignaler classTrait',
	#instVars : [
		'name',
		'relationSchema',
		'tuples',
		'pkConstraint',
		'fkConstraints'
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

{ #category : #constraints }
MRDBMSRelation >> addFKConstraint: aMRDBMSFKConstraint [
	self flag: #TODO. "Dedicated error."
	(aMRDBMSFKConstraint canBeAddedTo: self)
		ifFalse: [ 'FK constraint can not be added.' ].
	self fkConstraints add: aMRDBMSFKConstraint.
	aMRDBMSFKConstraint
		relation: self
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

{ #category : #constraints }
MRDBMSRelation >> constraints [
	| constraints |
	constraints := self fkConstraints copy.
	self hasPrimaryKey
		ifTrue: [ constraints add: self pkConstraint ].
	^ constraints
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

{ #category : #constraints }
MRDBMSRelation >> fkConstraints [
	^ fkConstraints
]

{ #category : #private }
MRDBMSRelation >> fkConstraints: anObject [
	fkConstraints := anObject
]

{ #category : #testing }
MRDBMSRelation >> hasPrimaryKey [
	^ self pkConstraint isNotNil
]

{ #category : #initialization }
MRDBMSRelation >> initialize [
	super initialize.
	self tuples: OrderedCollection new.
	self fkConstraints: OrderedCollection new
]

{ #category : #'tuples management' }
MRDBMSRelation >> insert: aRDBMSTuple [
	(self relationSchema isConformTuple: aRDBMSTuple)
		ifFalse: [ self error: 'Invalid tuple, can not be inserted in the relation.' ].
		
	self flag: #TODO. "Custom error with more details."
	(self constraints allSatisfy: [ :c | c isSatisfiedBy: aRDBMSTuple ])
		ifFalse: [ self error: 'Constraint violated.' ].
		
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

{ #category : #constraints }
MRDBMSRelation >> pkConstraint [
	^ pkConstraint
]

{ #category : #constraints }
MRDBMSRelation >> pkConstraint: aMRDBMSPrimaryKeyConstraint [
	self flag: #TODO. "Dedicated error."
	(aMRDBMSPrimaryKeyConstraint canBeAddedTo: self)
		ifFalse: [ 'The relation ',self name, 'does not satisfy unicity of tuples on attributes ', (aMRDBMSPrimaryKeyConstraint attributeNames joinUsing: ', ') ].
	pkConstraint := aMRDBMSPrimaryKeyConstraint.
	aMRDBMSPrimaryKeyConstraint
		relation: self
]

{ #category : #printing }
MRDBMSRelation >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: self name.
	aStream nextPut: $).
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
