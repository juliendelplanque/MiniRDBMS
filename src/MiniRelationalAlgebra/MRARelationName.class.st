Class {
	#name : #MRARelationName,
	#superclass : #MRANode,
	#instVars : [
		'content'
	],
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #'instance creation' }
MRARelationName class >> content: content [
	<generated>
	^ self new
		content: content;
		yourself
]

{ #category : #visiting }
MRARelationName >> acceptVisitor: aMRAVisitor [
	<generated>
	^ aMRAVisitor visitMRARelationName: self
]

{ #category : #accessing }
MRARelationName >> content [
	^ content
]

{ #category : #accessing }
MRARelationName >> content: anObject [
	content := anObject
]
