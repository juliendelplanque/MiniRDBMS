"
I am the INTEGER litteral.
"
Class {
	#name : #MSQLIntegerLitteral,
	#superclass : #MSQLLitteral,
	#instVars : [
		'integerString'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #'instance creation' }
MSQLIntegerLitteral class >> integerString: aString [
	^ self new
		integerString: aString;
		yourself
]

{ #category : #visiting }
MSQLIntegerLitteral >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLIntegerLitteral: self
]

{ #category : #accessing }
MSQLIntegerLitteral >> integerString [
	^ integerString
]

{ #category : #accessing }
MSQLIntegerLitteral >> integerString: aString [
	integerString := aString
]
