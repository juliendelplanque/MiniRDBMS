Class {
	#name : #MRANode,
	#superclass : #Object,
	#category : #'MiniRelationalAlgebra-AST'
}

{ #category : #printing }
MRANode >> printOn: aStream [
	MRASimplePrinter new
		outputStream: aStream;
		visit: self
]
