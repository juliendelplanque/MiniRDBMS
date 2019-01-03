"
Abstract superclass to simulate SQL booleans.

Can not use Pharo's booleans because SQL uses ternary logic.
"
Class {
	#name : #MRDBMSBoolean,
	#superclass : #Object,
	#category : #'MiniRDBMS-Basic'
}

{ #category : #'logical operations' }
MRDBMSBoolean >> & aRDBMSBoolean [
	^ self subclassResponsibility
]

{ #category : #'logical operations' }
MRDBMSBoolean >> not [
	^ self subclassResponsibility
]

{ #category : #'logical operations' }
MRDBMSBoolean >> | aRDBMSBoolean [
	^ self subclassResponsibility
]
