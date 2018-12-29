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
		'varcharDomain'
	],
	#category : #'MiniRDBMS-Core'
}

{ #category : #'built-in domains' }
MRDBMSDomain class >> char [
	^ charDomain ifNil: [ charDomain := self named: 'CHAR' validationBlock: #isCharacter ]
]

{ #category : #'built-in domains' }
MRDBMSDomain class >> integer [
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
MRDBMSDomain class >> real [
	^ realDomain ifNil: [ realDomain := self named: 'REAL' validationBlock: #isFloat ]
]

{ #category : #'built-in domains' }
MRDBMSDomain class >> varchar [
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

{ #category : #accessing }
MRDBMSDomain >> validationBlock [
	^ validationBlock
]

{ #category : #accessing }
MRDBMSDomain >> validationBlock: anObject [
	validationBlock := anObject
]
