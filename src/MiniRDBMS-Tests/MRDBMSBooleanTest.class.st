Class {
	#name : #MRDBMSBooleanTest,
	#superclass : #TestCase,
	#category : #'MiniRDBMS-Tests'
}

{ #category : #tests }
MRDBMSBooleanTest >> testAnd [
	self assert: MRDBMSTRUE singleton & MRDBMSTRUE singleton equals: MRDBMSTRUE singleton.
	self assert: MRDBMSTRUE singleton & MRDBMSFALSE singleton equals: MRDBMSFALSE singleton.
	self assert: MRDBMSTRUE singleton & MRDBMSNULL singleton equals: MRDBMSNULL singleton.
	
	self assert: MRDBMSFALSE singleton & MRDBMSTRUE singleton equals: MRDBMSFALSE singleton.
	self assert: MRDBMSFALSE singleton & MRDBMSFALSE singleton equals: MRDBMSFALSE singleton.
	self assert: MRDBMSFALSE singleton & MRDBMSNULL singleton equals: MRDBMSFALSE singleton.
	
	self assert: MRDBMSNULL singleton & MRDBMSTRUE singleton equals: MRDBMSNULL singleton.
	self assert: MRDBMSNULL singleton & MRDBMSFALSE singleton equals: MRDBMSFALSE singleton.
	self assert: MRDBMSNULL singleton & MRDBMSNULL singleton equals: MRDBMSNULL singleton.
]

{ #category : #tests }
MRDBMSBooleanTest >> testOr [
	self assert: MRDBMSTRUE singleton | MRDBMSTRUE singleton equals: MRDBMSTRUE singleton.
	self assert: MRDBMSTRUE singleton | MRDBMSFALSE singleton equals: MRDBMSTRUE singleton.
	self assert: MRDBMSTRUE singleton | MRDBMSNULL singleton equals: MRDBMSTRUE singleton.
	
	self assert: MRDBMSFALSE singleton | MRDBMSTRUE singleton equals: MRDBMSTRUE singleton.
	self assert: MRDBMSFALSE singleton | MRDBMSFALSE singleton equals: MRDBMSFALSE singleton.
	self assert: MRDBMSFALSE singleton | MRDBMSNULL singleton equals: MRDBMSNULL singleton.
	
	self assert: MRDBMSNULL singleton | MRDBMSTRUE singleton equals: MRDBMSTRUE singleton.
	self assert: MRDBMSNULL singleton | MRDBMSFALSE singleton equals: MRDBMSNULL singleton.
	self assert: MRDBMSNULL singleton | MRDBMSNULL singleton equals: MRDBMSNULL singleton.
]
