Class {
	#name : #MSQLGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'identifier',
		'tableIdentifier',
		'columnIdentifier',
		'dropTable',
		'columnDeclaration',
		'typeIdentifier',
		'createTable',
		'alterTableAddPKConstraint',
		'alterTableAddFKConstraint',
		'dataDefinitionLanguage',
		'dataManipulationLanguage',
		'expression',
		'unionClause',
		'exceptClause',
		'selectQuery',
		'selectClause',
		'whereClause',
		'fromClause',
		'dmlColumnIdentifier',
		'integerLiteral',
		'booleanLiteral',
		'trueLiteral',
		'falseLiteral',
		'nullLiteral'
	],
	#category : #'MiniSQL-Parser'
}

{ #category : #rules }
MSQLGrammar >> alterTableAddFKConstraint [
	^ 'ALTER' asParser caseInsensitive trimRight ,
	'TABLE' asParser caseInsensitive trimRight ,
	identifier token trimRight ,
	'ADD' asParser caseInsensitive trimRight ,
	'FOREIGN' asParser caseInsensitive trimRight ,
	'KEY' asParser caseInsensitive trimRight ,
	$( asParser trimRight ,
	(columnIdentifier token separatedBy: $, asParser trim) ,
	$) asParser trim ,
	'REFERENCES' asParser caseInsensitive trimRight ,
	tableIdentifier token
]

{ #category : #rules }
MSQLGrammar >> alterTableAddPKConstraint [
	^ 'ALTER' asParser caseInsensitive trimRight ,
	'TABLE' asParser caseInsensitive trimRight ,
	identifier token trimRight ,
	'ADD' asParser caseInsensitive trimRight ,
	'PRIMARY' asParser caseInsensitive trimRight ,
	'KEY' asParser caseInsensitive trimRight ,
	$( asParser trimRight ,
	(columnIdentifier token separatedBy: $, asParser trim) ,
	$) asParser trimLeft
]

{ #category : #'rules - literals' }
MSQLGrammar >> booleanLiteral [
	^ trueLiteral / falseLiteral
]

{ #category : #rules }
MSQLGrammar >> columnDeclaration [
	^ columnIdentifier token trimRight , typeIdentifier token
]

{ #category : #rules }
MSQLGrammar >> columnIdentifier [
	^ identifier
]

{ #category : #rules }
MSQLGrammar >> createTable [
	^ 'CREATE' asParser caseInsensitive trimRight ,
	'TABLE' asParser caseInsensitive trimRight ,
	tableIdentifier token trimRight ,
	$( asParser trimRight ,
		(columnDeclaration token separatedBy: $, asParser trim) ,
	$) asParser trimLeft
]

{ #category : #rules }
MSQLGrammar >> dataDefinitionLanguage [
	^ createTable / dropTable / alterTableAddPKConstraint / alterTableAddFKConstraint
]

{ #category : #rules }
MSQLGrammar >> dataManipulationLanguage [
	^ PPFailingParser new
]

{ #category : #rules }
MSQLGrammar >> dmlColumnIdentifier [
	^ tableIdentifier , $. asParser , columnIdentifier
]

{ #category : #rules }
MSQLGrammar >> dropTable [
	^ 'DROP' asParser caseInsensitive trimRight , 'TABLE' asParser caseInsensitive trimRight , tableIdentifier token
]

{ #category : #rules }
MSQLGrammar >> exceptClause [
	^ 'EXCEPT' asParser caseInsensitive trimRight ,
	selectQuery token
]

{ #category : #rules }
MSQLGrammar >> expression [
	^ PPExpressionParser new
		term: (dmlColumnIdentifier / integerLiteral / booleanLiteral / nullLiteral);
		group: [ :group | "Arithmetic expressions."
			group left: ($+ asParser / $- asParser) trim do: [ :left :operator :right |
				{ left . operator . right }. self flag: #TODO ] ];
		group: [ :group | "Boolean expressions."
			group prefix: 'NOT' asParser caseInsensitive token trim do: [ :operator :exp | { operator . exp }. self flag: #TODO ].
			group left: ('AND' asParser caseInsensitive / 'OR' asParser caseInsensitive) token trim do: [ :left :operator :right |
				{ left . operator . right }. self flag: #TODO ] ];
		yourself
]

{ #category : #'rules - literals' }
MSQLGrammar >> falseLiteral [
	^ 'FALSE' asParser
]

{ #category : #rules }
MSQLGrammar >> fromClause [
	^ 'FROM' asParser caseInsensitive trimRight , (tableIdentifier token separatedBy: $, asParser trim)
]

{ #category : #rules }
MSQLGrammar >> identifier [
	^ #letter asParser , (#letter asParser / #digit asParser) star
]

{ #category : #'rules - literals' }
MSQLGrammar >> integerLiteral [
	^ $- asParser optional , #digit asParser plus
]

{ #category : #'rules - literals' }
MSQLGrammar >> nullLiteral [
	^ 'NULL' asParser
]

{ #category : #rules }
MSQLGrammar >> selectClause [
	^ 'SELECT' asParser caseInsensitive trimRight
		, (dmlColumnIdentifier token separatedBy: $, asParser trim)
]

{ #category : #rules }
MSQLGrammar >> selectQuery [
	^ selectClause trimRight ,
	fromClause trimRight ,
	whereClause trimRight optional,
	(unionClause / exceptClause) optional
]

{ #category : #accessing }
MSQLGrammar >> start [
	^ dataDefinitionLanguage / dataManipulationLanguage
]

{ #category : #rules }
MSQLGrammar >> tableIdentifier [
	^ identifier
]

{ #category : #'rules - literals' }
MSQLGrammar >> trueLiteral [
	^ 'TRUE' asParser
]

{ #category : #rules }
MSQLGrammar >> typeIdentifier [
	^ identifier
]

{ #category : #rules }
MSQLGrammar >> unionClause [
	^ 'UNION' asParser caseInsensitive trimRight ,
	selectQuery token
]

{ #category : #rules }
MSQLGrammar >> whereClause [
	^ 'WHERE' asParser caseInsensitive trimRight , expression token
]
