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
MSQLGrammarTest >> testExpression [
	self parse: '1' rule: #expression.
	self parse: 'TRUE' rule: #expression.
	self parse: 'FALSE' rule: #expression.
	self parse: 'NULL' rule: #expression.
	
	self parse: '1 + 1' rule: #expression.
	self parse: '1 * 1' rule: #expression.
	
	self parse: 'TRUE AND TRUE' rule: #expression.
	self parse: 'NOT TRUE AND TRUE' rule: #expression.
	self parse: 'TRUE OR NOT FALSE' rule: #expression.
]

{ #category : #tests }
MSQLGrammarTest >> testIdentifier [
	self parse: 'a' rule: #identifier.
	self parse: 'foo1' rule: #identifier.
	self fail: '1' rule: #identifier.
	self fail: '1foo' rule: #identifier
]

{ #category : #tests }
MSQLGrammarTest >> testInsertQuery [
	self parse: 'INSERT INTO t(a,b,c,d) VALUES (1, TRUE, FALSE, NULL)' rule: #insertQuery
]

{ #category : #tests }
MSQLGrammarTest >> testInsertQuery2 [
	self parse: 'INSERT INTO t(a,b,c,d) VALUES ((1, TRUE, FALSE, NULL), (2, FALSE, FALSE, NULL), (3, TRUE, TRUE, NULL))' rule: #insertQuery
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
