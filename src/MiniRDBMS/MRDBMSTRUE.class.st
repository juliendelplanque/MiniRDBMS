"
Simulates SQL's TRUE.
"
Class {
	#name : #MRDBMSTRUE,
	#superclass : #MRDBMSBoolean,
	#classVars : [
		'Singleton'
	],
	#category : #'MiniRDBMS-Basic'
}

{ #category : #'instance creation' }
MRDBMSTRUE class >> new [
	self error: 'You should not instantiate myself, use the singleton.'
]

{ #category : #'instance creation' }
MRDBMSTRUE class >> singleton [
	^ Singleton ifNil: [ Singleton := self basicNew ]
]

{ #category : #'logical operations' }
MRDBMSTRUE >> & aRDBMSBoolean [
	aRDBMSBoolean = self
		ifTrue: [ ^ self ].
	
	aRDBMSBoolean = MRDBMSFALSE singleton
		ifTrue: [ ^ MRDBMSFALSE singleton ].
		
	aRDBMSBoolean = MRDBMSNULL singleton
		ifTrue: [ ^ MRDBMSNULL singleton ].
		
	self error: 'Invalid object for SQL logic.'
]

{ #category : #'logical operations' }
MRDBMSTRUE >> not [
	^ MRDBMSFALSE singleton
]

{ #category : #printing }
MRDBMSTRUE >> printOn: aStream [
	aStream nextPutAll: 'TRUE'
]

{ #category : #'logical operations' }
MRDBMSTRUE >> | aRDBMSBoolean [
	aRDBMSBoolean = self
		ifTrue: [ ^ self ].
	
	aRDBMSBoolean = MRDBMSFALSE singleton
		ifTrue: [ ^ self ].
		
	aRDBMSBoolean = MRDBMSNULL singleton
		ifTrue: [ ^ self ].
		
	self error: 'Invalid object for SQL logic.'
]
