Class {
	#name : #MSQLMultiItemsClause,
	#superclass : #MSQLClause,
	#instVars : [
		'items'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #'instance creation' }
MSQLMultiItemsClause class >> items: anArrayOfItems [
	^ self new
		items: anArrayOfItems;
		yourself
]

{ #category : #accessing }
MSQLMultiItemsClause >> items [
	^ items
]

{ #category : #accessing }
MSQLMultiItemsClause >> items: anObject [
	items := anObject
]
