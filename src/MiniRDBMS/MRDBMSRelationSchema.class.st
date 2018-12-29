Class {
	#name : #MRDBMSRelationSchema,
	#superclass : #Object,
	#traits : 'MRDBMSTErrorSignaler',
	#classTraits : 'MRDBMSTErrorSignaler classTrait',
	#instVars : [
		'attributesToDomains'
	],
	#category : #'MiniRDBMS-Core'
}

{ #category : #comparing }
MRDBMSRelationSchema >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ attributesToDomains = anObject attributesToDomains
]

{ #category : #adding }
MRDBMSRelationSchema >> addAttributeNamed: aString withDomain: aMRDBMSDomain [
	(self attributesToDomains includesKey: aString)
		ifTrue: [ self error: ('Attribute named {1} already present in the relation schema.' format: { aString }) ].
	self attributesToDomains
		at: aString put: aMRDBMSDomain
]

{ #category : #accessing }
MRDBMSRelationSchema >> attributeNames [
	^ self attributesToDomains keys
]

{ #category : #enumerating }
MRDBMSRelationSchema >> attributeNamesAndDomainsDo: twoArgsBlock [
	self attributesToDomains keysAndValuesDo: twoArgsBlock
]

{ #category : #private }
MRDBMSRelationSchema >> attributesToDomains [
	^ attributesToDomains
]

{ #category : #private }
MRDBMSRelationSchema >> attributesToDomains: anObject [
	attributesToDomains := anObject
]

{ #category : #accessing }
MRDBMSRelationSchema >> domainOf: attributeName [
	^ self attributesToDomains at: attributeName
]

{ #category : #accessing }
MRDBMSRelationSchema >> domains [
	^ self attributesToDomains values
]

{ #category : #comparing }
MRDBMSRelationSchema >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ attributesToDomains hash
]

{ #category : #accessing }
MRDBMSRelationSchema >> indexOfAttributeNamed: aString [
	^ self attributesToDomains
		indexOfKey: aString
		ifAbsent: [ self error: ('{1} is not an existing attribute.' format: { aString }) ]
]

{ #category : #initialization }
MRDBMSRelationSchema >> initialize [
	super initialize.
	self attributesToDomains: OrderedDictionary new
]

{ #category : #testing }
MRDBMSRelationSchema >> isConformTuple: aMRDBMSTuple [
	"Answer whether aMRDBMSTuple is conform the myself or not (i.e. if I describe the data held in the tuple or not)."
	self domains with: aMRDBMSTuple data do: [ :domain :data |
		(domain isInDomain: data)
			ifFalse: [ ^ false ] ].
		
	^ true
]

{ #category : #printing }
MRDBMSRelationSchema >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: '({ '.
	self attributesToDomains associations
		do: [ :assoc |
			assoc key printOn: aStream.
			aStream
				nextPutAll: ' : ';
				nextPutAll: assoc value name. ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPutAll: ' })'.
]
