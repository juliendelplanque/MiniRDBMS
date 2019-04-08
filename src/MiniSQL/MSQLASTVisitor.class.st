Class {
	#name : #MSQLASTVisitor,
	#superclass : #Object,
	#category : #'MiniSQL-Visitors'
}

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLAlterTableAddFKConstraint: aMSQLAlterTableAddFKConstraint [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLAlterTableAddPKConstraint: aMSQLAlterTableAddPKConstraint [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLColumnDeclaration: aMSQLColumnDeclaration [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLColumnIdentifier: aMSQLColumnIdentifier [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLCommandList: aMSQLCommandList [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLCreateTable: aMSQLCreateTable [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLDomainIdentifier: aMSQLDomainIdentifier [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLDropTable: aMSQLDropTable [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLFALSELitteral: aMSQLFALSELitteral [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLIdentifier: aMSQLIdentifier [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLInsertQuery: aMSQLInsertQuery [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLIntegerLitteral: aMSQLIntegerLitteral [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLNULLLitteral: aMSQLNULLLitteral [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLTRUELitteral: aMSQLTRUELitteral [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLTableIdentifier: aMSQLTableIdentifier [
	^ self subclassResponsibility
]

{ #category : #visiting }
MSQLASTVisitor >> visitMSQLTuple: aMSQLTuple [
	^ self subclassResponsibility
]
