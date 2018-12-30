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
