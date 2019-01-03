"
I model an identifier for which we do not now yet what it is.

It might be because it reference an entity being created.
"
Class {
	#name : #MSQLIdentifier,
	#superclass : #MSQLASTNode,
	#instVars : [
		'name'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #'instance creation' }
MSQLIdentifier class >> named: anObject [
	^ self new
		name: anObject;
		yourself
]

{ #category : #visiting }
MSQLIdentifier >> acceptVisitor: aMSQLASTVisitor [
	^ aMSQLASTVisitor visitMSQLIdentifier: self
]

{ #category : #converting }
MSQLIdentifier >> asColumnIdentifier [
	^ MSQLColumnIdentifier named: self name
]

{ #category : #converting }
MSQLIdentifier >> asDomainIdentifier [
	^ MSQLDomainIdentifier named: self name
]

{ #category : #converting }
MSQLIdentifier >> asTableIdentifier [
	^ MSQLTableIdentifier named: self name
]

{ #category : #accessing }
MSQLIdentifier >> name [
	^ name
]

{ #category : #accessing }
MSQLIdentifier >> name: anObject [
	name := anObject
]

{ #category : #printing }
MSQLIdentifier >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(.
	aStream nextPutAll: self name.
	aStream
		<< $)
]
