Class {
	#name : #MRDBMSTuple,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'MiniRDBMS-Core'
}

{ #category : #'instance creation' }
MRDBMSTuple class >> data: anArray [
	^ self new
		data: anArray;
		yourself
]

{ #category : #comparing }
MRDBMSTuple >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ data = anObject data
]

{ #category : #accessing }
MRDBMSTuple >> at: aString withSchema: relationSchema [
	"Returns the value for the attribute aString."
	^ self atIndex: (relationSchema indexOfAttributeNamed: aString)
]

{ #category : #accessing }
MRDBMSTuple >> atIndex: anInteger [
	^ self data at: anInteger
]

{ #category : #accessing }
MRDBMSTuple >> data [
	^ data
]

{ #category : #accessing }
MRDBMSTuple >> data: anObject [
	data := anObject
]

{ #category : #comparing }
MRDBMSTuple >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ data hash
]

{ #category : #printing }
MRDBMSTuple >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self data do: [ :d |
		d printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $)
]

{ #category : #transforming }
MRDBMSTuple >> projectOn: attributeNames withSchema: aMRDBMSRelationSchema [
	^ self class data: (self data withIndexSelect: [ :element :index |
									attributeNames includes: (aMRDBMSRelationSchema attributeNameAtIndex: index) ])
]
