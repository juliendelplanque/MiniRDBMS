"
I model SQL's NULL value.

I am totally stateless.

I should not be instantiated by hand. I have a singleton accessible via class-side methode #singleton.
"
Class {
	#name : #MRDBMSNULL,
	#superclass : #Object,
	#classVars : [
		'Singleton'
	],
	#category : #'MiniRDBMS-Basic'
}

{ #category : #'instance creation' }
MRDBMSNULL class >> new [
	self error: 'You should not instantiate myself, use the singleton.'
]

{ #category : #'instance creation' }
MRDBMSNULL class >> singleton [
	^ Singleton ifNil: [ Singleton := self basicNew ]
]

{ #category : #'logical operations' }
MRDBMSNULL >> & aRDBMSBoolean [
	aRDBMSBoolean = self
		ifTrue: [ ^ self ].
	
	aRDBMSBoolean = MRDBMSTRUE singleton
		ifTrue: [ ^ self ].
		
	aRDBMSBoolean = MRDBMSFALSE singleton
		ifTrue: [ ^ MRDBMSFALSE singleton ].
		
	self error: 'Invalid object for SQL logic.'
]

{ #category : #arithmetic }
MRDBMSNULL >> * aNumber [
	^ self
]

{ #category : #arithmetic }
MRDBMSNULL >> + aNumber [
	^ self
]

{ #category : #arithmetic }
MRDBMSNULL >> - aNumber [
	^ self
]

{ #category : #arithmetic }
MRDBMSNULL >> / aNumber [
	^ self
]

{ #category : #arithmetic }
MRDBMSNULL >> // aNumber [
	^ self
]

{ #category : #arithmetic }
MRDBMSNULL >> \\ aNumber [
	^ self
]

{ #category : #arithmetic }
MRDBMSNULL >> abs [
	^ self
]

{ #category : #converting }
MRDBMSNULL >> adaptToNumber: rcvr andSend: selector [
	^ self
]

{ #category : #arithmetic }
MRDBMSNULL >> negated [
	^ self
]

{ #category : #'logical operations' }
MRDBMSNULL >> not [
	^ self
]

{ #category : #arithmetic }
MRDBMSNULL >> quo: aNumber [
	^ self
]

{ #category : #arithmetic }
MRDBMSNULL >> reciprocal [
	^ self
]

{ #category : #arithmetic }
MRDBMSNULL >> rem: aNumber [ 
	^ self
]

{ #category : #'logical operations' }
MRDBMSNULL >> | aRDBMSBoolean [
	aRDBMSBoolean = self
		ifTrue: [ ^ self ].
	
	aRDBMSBoolean = MRDBMSTRUE singleton
		ifTrue: [ ^ MRDBMSTRUE singleton ].
		
	aRDBMSBoolean = MRDBMSFALSE singleton
		ifTrue: [ ^ self ].
		
	self error: 'Invalid object for SQL logic.'
]
