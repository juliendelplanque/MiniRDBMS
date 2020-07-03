"
I model the domain of one of the attributes of a relation.

A model has a #name and a #validationBlock.
The #validationBlock can be used to evaluate if a value belongs or not to the domain via #isInDomain: (returning respectively true or false).
"
Class {
	#name : #MRDBMSDomain,
	#superclass : #Object,
	#instVars : [
		'name',
		'validationBlock'
	],
	#classInstVars : [
		'charDomain',
		'integerDomain',
		'realDomain',
		'varcharDomain',
		'boolDomain'
	],
	#category : #'MiniRDBMS-Core'
}

{ #category : #'built-in domains' }
MRDBMSDomain class >> boolean [
	<sampleInstance>
	<domain>
	^ boolDomain ifNil: [ boolDomain := self named: 'BOOL' validationBlock: #isRDBMSBoolean ]
]

{ #category : #accessing }
MRDBMSDomain class >> builtInDomains [
	^ (Pragma allNamed: #domain in: self class) collect: [ :pragma |
			pragma methodSelector value: self ]
]

{ #category : #'built-in domains' }
MRDBMSDomain class >> char [
	<sampleInstance>
	<domain>
	^ charDomain ifNil: [ charDomain := self named: 'CHAR' validationBlock: #isCharacter ]
]

{ #category : #'built-in domains' }
MRDBMSDomain class >> integer [
	<sampleInstance>
	<domain>
	^ integerDomain ifNil: [ integerDomain := self named: 'INTEGER' validationBlock: #isInteger ]
]

{ #category : #'instance creation' }
MRDBMSDomain class >> named: aString validationBlock: aBlock [
	^ self new
		name: aString;
		validationBlock: aBlock;
		yourself
]

{ #category : #'built-in domains' }
MRDBMSDomain class >> varchar [
	<sampleInstance>
	<domain>
	^ varcharDomain ifNil: [ varcharDomain := self named: 'VARCHAR' validationBlock: #isString ]
]

{ #category : #testing }
MRDBMSDomain >> isInDomain: anObject [
	"Answer whether anObject belongs to the domain (myself) or not."
	^ self validationBlock value: anObject 
]

{ #category : #accessing }
MRDBMSDomain >> name [
	^ name
]

{ #category : #accessing }
MRDBMSDomain >> name: anObject [
	name := anObject
]

{ #category : #printing }
MRDBMSDomain >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	aStream nextPutAll: self name.
	aStream nextPut: $).
]

{ #category : #accessing }
MRDBMSDomain >> validationBlock [
	^ validationBlock
]

{ #category : #accessing }
MRDBMSDomain >> validationBlock: anObject [
	validationBlock := anObject
]
