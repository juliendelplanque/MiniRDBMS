"
Simulates SQL's FALSE.
"
Class {
	#name : #MRDBMSFALSE,
	#superclass : #MRDBMSBoolean,
	#classVars : [
		'Singleton'
	],
	#category : #'MiniRDBMS-Basic'
}

{ #category : #'instance creation' }
MRDBMSFALSE class >> new [
	self error: 'You should not instantiate myself, use the singleton.'
]

{ #category : #'instance creation' }
MRDBMSFALSE class >> singleton [
	^ Singleton ifNil: [ Singleton := self basicNew ]
]

{ #category : #'logical operations' }
MRDBMSFALSE >> & aRDBMSBoolean [
	aRDBMSBoolean = self
		ifTrue: [ ^ self ].
	
	aRDBMSBoolean = MRDBMSTRUE singleton
		ifTrue: [ ^ self ].
		
	aRDBMSBoolean = MRDBMSNULL singleton
		ifTrue: [ ^ self ].
		
	self error: 'Invalid object for SQL logic.'
]

{ #category : #'logical operations' }
MRDBMSFALSE >> not [
	^ MRDBMSTRUE singleton
]

{ #category : #'logical operations' }
MRDBMSFALSE >> | aRDBMSBoolean [
	aRDBMSBoolean = self
		ifTrue: [ ^ self ].
	
	aRDBMSBoolean = MRDBMSTRUE singleton
		ifTrue: [ ^ MRDBMSTRUE singleton ].
		
	aRDBMSBoolean = MRDBMSNULL singleton
		ifTrue: [ ^ MRDBMSNULL singleton ].
		
	self error: 'Invalid object for SQL logic.'
]
