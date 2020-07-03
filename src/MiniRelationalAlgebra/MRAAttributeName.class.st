Class {
	#name : #MRAAttributeName,
	#superclass : #MRANode,
	#instVars : [
		'content'
	],
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #'instance creation' }
MRAAttributeName class >> content: content [
	<generated>
	^ self new
		content: content;
		yourself
]

{ #category : #visiting }
MRAAttributeName >> acceptVisitor: aMRAVisitor [
	<generated>
	^ aMRAVisitor visitMRAAttributeName: self
]

{ #category : #accessing }
MRAAttributeName >> content [
	^ content
]

{ #category : #accessing }
MRAAttributeName >> content: anObject [
	content := anObject
]
