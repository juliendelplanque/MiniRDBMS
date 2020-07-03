Class {
	#name : #MRAVisitor,
	#superclass : #Object,
	#category : #'MiniRelationalAlgebra-Visitors'
}

{ #category : #visiting }
MRAVisitor >> visit: anObject [
	<generated>
	^ anObject acceptVisitor: self
]

{ #category : #visiting }
MRAVisitor >> visitMRAAttributeName: aMRAAttributeName [
	<generated>
	^ self subclassResponsibility
]

{ #category : #visiting }
MRAVisitor >> visitMRACartesianProduct: aMRACartesianProduct [
	<generated>
	^ self subclassResponsibility
]

{ #category : #visiting }
MRAVisitor >> visitMRAIntersection: aMRAIntersection [
	<generated>
	^ self subclassResponsibility
]

{ #category : #visiting }
MRAVisitor >> visitMRALogicalConjunction: aMRALogicalConjunction [
	<generated>
	^ self subclassResponsibility
]

{ #category : #visiting }
MRAVisitor >> visitMRALogicalDisjunction: aMRALogicalDisjunction [
	<generated>
	^ self subclassResponsibility
]

{ #category : #visiting }
MRAVisitor >> visitMRAPredicateFunctionCall: aMRAPredicateFunctionCall [
	<generated>
	^ self subclassResponsibility
]

{ #category : #visiting }
MRAVisitor >> visitMRAProjection: aMRAProjection [
	<generated>
	^ self subclassResponsibility
]

{ #category : #visiting }
MRAVisitor >> visitMRARelationName: aMRARelationName [
	<generated>
	^ self subclassResponsibility
]

{ #category : #visiting }
MRAVisitor >> visitMRARename: aMRARename [
	<generated>
	^ self subclassResponsibility
]

{ #category : #visiting }
MRAVisitor >> visitMRASelection: aMRASelection [
	<generated>
	^ self subclassResponsibility
]

{ #category : #visiting }
MRAVisitor >> visitMRAUnion: aMRAUnion [
	<generated>
	^ self subclassResponsibility
]
