Class {
	#name : #MSQLGrammarTest,
	#superclass : #PPCompositeParserTest,
	#category : #'MiniSQL-Tests'
}

{ #category : #accessing }
MSQLGrammarTest >> parserClass [
	^ MSQLGrammar
]

{ #category : #tests }
MSQLGrammarTest >> testAlterTableAddFKConstraint [
	self parse: 'ALTER TABLE maTable ADD FOREIGN KEY(maitre) REFERENCES autreTable' rule: #alterTableAddFKConstraint
]

{ #category : #tests }
MSQLGrammarTest >> testAlterTableAddFKConstraint2 [
	self parse: 'ALTER TABLE maTable ADD FOREIGN KEY(id,maitre) REFERENCES autreTable' rule: #alterTableAddFKConstraint
]

{ #category : #tests }
MSQLGrammarTest >> testAlterTableAddPKConstraint [
	self parse: 'ALTER TABLE maTable ADD PRIMARY KEY(id,nom)' rule: #alterTableAddPKConstraint
]

{ #category : #tests }
MSQLGrammarTest >> testAlterTableAddPKConstraint2 [
	self parse: 'ALTER TABLE maTable ADD PRIMARY KEY(id)' rule: #alterTableAddPKConstraint
]

{ #category : #tests }
MSQLGrammarTest >> testCreateTable [
	self parse: 'CREATE TABLE maTable (
	id INTEGER,
	nom VARCHAR
)' rule: #createTable
]

{ #category : #tests }
MSQLGrammarTest >> testDropTable [
	self parse: 'DROP TABLE maTable' rule: #dropTable
]

{ #category : #tests }
MSQLGrammarTest >> testIdentifier [
	self parse: 'a' rule: #identifier.
	self parse: 'foo1' rule: #identifier.
	self fail: '1' rule: #identifier.
	self fail: '1foo' rule: #identifier
]

{ #category : #tests }
MSQLGrammarTest >> testSelectQuery [
	self parse: 'SELECT table.c1, table.c2, table.c3 FROM table' rule: #selectQuery
]

{ #category : #tests }
MSQLGrammarTest >> testSelectQuery2 [
	self parse: 'SELECT table.c1, table2.c2 FROM table, table2' rule: #selectQuery
]

{ #category : #tests }
MSQLGrammarTest >> testSelectQueryExcept [
	self parse: 'SELECT table.c1, table.c2, table.c3 FROM table EXCEPT SELECT table.c1, table.c2, table.c3 FROM table' rule: #selectQuery
]

{ #category : #tests }
MSQLGrammarTest >> testSelectQueryUnion [
	self parse: 'SELECT table.c1, table.c2, table.c3 FROM table UNION SELECT table.c1, table.c2, table.c3 FROM table' rule: #selectQuery
]

{ #category : #tests }
MSQLGrammarTest >> testSelectQueryUnionExcept [
	self parse: 'SELECT table.c1, table.c2, table.c3 FROM table UNION SELECT table.c1, table.c2, table.c3 FROM table EXCEPT SELECT table.c1, table.c2, table.c3 FROM table' rule: #selectQuery
]
