Class {
	#name : #MSQLMonoItemClause,
	#superclass : #MSQLClause,
	#instVars : [
		'item'
	],
	#category : #'MiniSQL-AST'
}

{ #category : #'instance creation' }
MSQLMonoItemClause class >> item: anItem [
	^ self new
		item: anItem;
		yourself
]

{ #category : #accessing }
MSQLMonoItemClause >> item [
	^ item
]

{ #category : #accessing }
MSQLMonoItemClause >> item: anObject [
	item := anObject
]
