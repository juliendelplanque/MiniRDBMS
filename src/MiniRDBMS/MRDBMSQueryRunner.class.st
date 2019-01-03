"
I run a query provided as an AST.

I work naively for SELECT queries but for all other kinds of query it is ok to use me.
"
Class {
	#name : #MRDBMSQueryRunner,
	#superclass : #MSQLASTVisitor,
	#traits : 'MRDBMSTErrorSignaler',
	#classTraits : 'MRDBMSTErrorSignaler classTrait',
	#instVars : [
		'database',
		'executionStack'
	],
	#category : #'MiniRDBMS-Running'
}

{ #category : #accessing }
MRDBMSQueryRunner >> database [
	^ database
]

{ #category : #accessing }
MRDBMSQueryRunner >> database: anObject [
	database := anObject
]

{ #category : #initialization }
MRDBMSQueryRunner >> initialize [
	super initialize.
	executionStack := Stack new
]

{ #category : #visiting }
MRDBMSQueryRunner >> visitMSQLAlterTableAddFKConstraint: aMSQLAlterTableAddFKConstraint [
	| relation columnNames constraint referencedRelation |
	relation := aMSQLAlterTableAddFKConstraint tableIdentifier acceptVisitor: self.
	executionStack push: relation.
	columnNames := aMSQLAlterTableAddFKConstraint columnIdentifiers collect: [ :c | c acceptVisitor: self ].
	executionStack pop.
	referencedRelation := aMSQLAlterTableAddFKConstraint referencedTableIdentifier acceptVisitor: self.
	
	constraint := MRDBMSForeignKeyConstraint new
						attributeNames: columnNames;
						referencedRelation: referencedRelation;
						yourself.
	
	relation addFKConstraint: constraint
]

{ #category : #visiting }
MRDBMSQueryRunner >> visitMSQLAlterTableAddPKConstraint: aMSQLAlterTableAddPKConstraint [
	| relation columnNames constraint |
	relation := aMSQLAlterTableAddPKConstraint tableIdentifier acceptVisitor: self.
	executionStack push: relation.
	columnNames := aMSQLAlterTableAddPKConstraint columnIdentifiers collect: [ :c | c acceptVisitor: self ].
	executionStack pop.
	constraint := MRDBMSPrimaryKeyConstraint new
						attributeNames: columnNames;
						yourself.
	
	relation pkConstraint: constraint
]

{ #category : #visiting }
MRDBMSQueryRunner >> visitMSQLColumnDeclaration: aMSQLColumnDeclaration [
	executionStack top
		addAttributeNamed: (aMSQLColumnDeclaration columnIdentifier acceptVisitor: self)
		withDomain: (aMSQLColumnDeclaration domainIdentifier acceptVisitor: self)
]

{ #category : #visiting }
MRDBMSQueryRunner >> visitMSQLColumnIdentifier: aMSQLColumnIdentifier [
	(executionStack top relationSchema hasAttributeNamed: aMSQLColumnIdentifier name)
		ifFalse: [ self error: 'Attribute ', aMSQLColumnIdentifier name , ' does not exists in relation ', executionStack top name ].
	
	^ aMSQLColumnIdentifier name
]

{ #category : #visiting }
MRDBMSQueryRunner >> visitMSQLCreateTable: aMSQLCreateTable [
	| relationSchema tableName |
	tableName := aMSQLCreateTable tableIdentifier acceptVisitor: self.
	(self database relations anySatisfy: [ :any | any name = tableName ])
		ifTrue: [ self errorRelationAlreadyExists: tableName ].
	
	relationSchema := MRDBMSRelationSchema new.
	executionStack push: relationSchema.
	aMSQLCreateTable columnDeclarations
		do: [ :columnDeclaration | columnDeclaration acceptVisitor: self ].
	executionStack pop.
	self database
		addRelation: (MRDBMSRelation
							named: tableName
							relationSchema: relationSchema)
]

{ #category : #visiting }
MRDBMSQueryRunner >> visitMSQLDomainIdentifier: aMSQLDomainIdentifier [
	"Resolve domain. Returns the corresponding object."
	^ MRDBMSDomain builtInDomains detect: [ :d |
		d name = aMSQLDomainIdentifier name ]
]

{ #category : #visiting }
MRDBMSQueryRunner >> visitMSQLDropTable: aMSQLDropTable [
	| tableName |
	tableName := aMSQLDropTable tableIdentifier acceptVisitor: self.
	self database removeRelation: tableName
]

{ #category : #visiting }
MRDBMSQueryRunner >> visitMSQLIdentifier: aMSQLIdentifier [
	"In case of an identifier, we just return its name because we do not know to what it refers.
	 It might just be an identifier for the name of a new entity."
	^ aMSQLIdentifier name
]

{ #category : #visiting }
MRDBMSQueryRunner >> visitMSQLTableIdentifier: aMSQLTableIdentifier [
	^ self database relations
		detect: [ :r | r name = aMSQLTableIdentifier name ]
]
