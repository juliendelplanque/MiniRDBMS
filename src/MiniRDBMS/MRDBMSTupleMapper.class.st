"
I allow to map a tuple from a relation schema to another.
"
Class {
	#name : #MRDBMSTupleMapper,
	#superclass : #Object,
	#instVars : [
		'baseRelationSchema',
		'targetRelationSchema',
		'mappingArray'
	],
	#category : #'MiniRDBMS-Utility'
}

{ #category : #'instance creation' }
MRDBMSTupleMapper class >> baseRelationSchema: aMRDBMSRelationSchema targetRelationSchema: anotherMRDBMSRelationSchema [
	^ self new
		baseRelationSchema: aMRDBMSRelationSchema;
		targetRelationSchema: anotherMRDBMSRelationSchema;
		yourself
]

{ #category : #accessing }
MRDBMSTupleMapper >> baseRelationSchema [
	^ baseRelationSchema
]

{ #category : #accessing }
MRDBMSTupleMapper >> baseRelationSchema: anObject [
	baseRelationSchema := anObject
]

{ #category : #private }
MRDBMSTupleMapper >> buildMappingArray [
	"Builds an array a for which a[i] is the index in target relation schema to which map value at index i in base relation schema."
	^ self baseRelationSchema attributeNames collect: [ :attributeName |
		self targetRelationSchema indexOfAttributeNamed: attributeName ]
]

{ #category : #'operators-mapping' }
MRDBMSTupleMapper >> map: aMRDBMSTuple [
	"Maps the tuple from baseRelationSchema to targetRelationSchema."
	^ MRDBMSTuple data: ((1 to: aMRDBMSTuple size) collect: [ :i |
		aMRDBMSTuple atIndex: (self mappingArray at: i) ])
]

{ #category : #private }
MRDBMSTupleMapper >> mappingArray [
	^ mappingArray ifNil: [ mappingArray := self buildMappingArray ]
]

{ #category : #accessing }
MRDBMSTupleMapper >> targetRelationSchema [
	^ targetRelationSchema
]

{ #category : #accessing }
MRDBMSTupleMapper >> targetRelationSchema: anObject [
	targetRelationSchema := anObject
]
