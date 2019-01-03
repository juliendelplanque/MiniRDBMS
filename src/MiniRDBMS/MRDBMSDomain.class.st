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

{ #category : #accessing }
MRDBMSDomain class >> builtInDomains [
	^ (Pragma allNamed: #domain in: self class) collect: [ :pragma |
			pragma methodSelector value: self ]
]

{ #category : #'built-in domains' }
MRDBMSDomain class >> char [
	<domain>
	^ charDomain ifNil: [ charDomain := self named: 'CHAR' validationBlock: #isCharacter ]
]

{ #category : #'built-in domains' }
MRDBMSDomain class >> integer [
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

{ #category : #accessing }
MRDBMSDomain >> validationBlock [
	^ validationBlock
]

{ #category : #accessing }
MRDBMSDomain >> validationBlock: anObject [
	validationBlock := anObject
]
