Class {
	#name : #MRDBMSNULLTest,
	#superclass : #TestCase,
	#instVars : [
		'null'
	],
	#category : #'MiniRDBMS-Tests'
}

{ #category : #running }
MRDBMSNULLTest >> setUp [
	super setUp.
	null := MRDBMSNULL singleton
]

{ #category : #tests }
MRDBMSNULLTest >> testAbs [
	self assert: (null abs) equals: null
]

{ #category : #tests }
MRDBMSNULLTest >> testAdaptToNumberAndSend [
	self assert: (null adaptToNumber: 1 andSend: #+) equals: null.
	self assert: (null adaptToNumber: 1.5 andSend: #+) equals: null.
	self assert: (null adaptToNumber: 1/2 andSend: #+) equals: null.
	self assert: (null adaptToNumber: 1.02s2 andSend: #+) equals: null.
	self assert: (null adaptToNumber: SmallInteger maxVal + 1  andSend: #+) equals: null.
	self assert: (null adaptToNumber: SmallInteger minVal + 1  andSend: #+) equals: null
]

{ #category : #tests }
MRDBMSNULLTest >> testAddition [
	self assert: (null + 1) equals: null
]

{ #category : #tests }
MRDBMSNULLTest >> testDivision [
	self assert: (null / 2) equals: null
]

{ #category : #tests }
MRDBMSNULLTest >> testIntegerQuotient [
	self assert: (null // 2) equals: null
]

{ #category : #tests }
MRDBMSNULLTest >> testModulo [
	self assert: (null \\ 2) equals: null
]

{ #category : #tests }
MRDBMSNULLTest >> testMultiplication [
	self assert: (null * 2) equals: null
]

{ #category : #tests }
MRDBMSNULLTest >> testNegated [
	self assert: (null negated) equals: null
]

{ #category : #tests }
MRDBMSNULLTest >> testQuo [
	self assert: (null quo: 2) equals: null
]

{ #category : #tests }
MRDBMSNULLTest >> testReciprocal [
	self assert: (null reciprocal) equals: null
]

{ #category : #tests }
MRDBMSNULLTest >> testRem [
	self assert: (null rem: 2) equals: null
]

{ #category : #tests }
MRDBMSNULLTest >> testSubstraction [
	self assert: (null - 1) equals: null
]
