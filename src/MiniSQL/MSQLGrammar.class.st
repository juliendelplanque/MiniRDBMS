Class {
	#name : #MSQLGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'identifier',
		'tableIdentifier',
		'columnIdentifier',
		'dropTable',
		'columnDeclaration',
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
		'nullLiteral',
		'domainIdentifier',
		'insertQuery',
		'tuple'
	],
	#category : #'MiniSQL-Parser'
}

{ #category : #rules }
MSQLGrammar >> alterTableAddFKConstraint [
	^ 'ALTER' asParser trimRight ,
	'TABLE' asParser trimRight ,
	tableIdentifier token trimRight ,
	'ADD' asParser trimRight ,
	'FOREIGN' asParser trimRight ,
	'KEY' asParser trimRight ,
	$( asParser trimRight ,
	(columnIdentifier token separatedBy: $, asParser trim) ,
	$) asParser trim ,
	'REFERENCES' asParser trimRight ,
	tableIdentifier token
]

{ #category : #rules }
MSQLGrammar >> alterTableAddPKConstraint [
	^ 'ALTER' asParser trimRight ,
	'TABLE' asParser trimRight ,
	tableIdentifier token trimRight ,
	'ADD' asParser trimRight ,
	'PRIMARY' asParser trimRight ,
	'KEY' asParser trimRight ,
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
	^ identifier token trimRight , domainIdentifier token
]

{ #category : #rules }
MSQLGrammar >> columnIdentifier [
	^ identifier
]

{ #category : #rules }
MSQLGrammar >> createTable [
	^ 'CREATE' asParser trimRight ,
	'TABLE' asParser trimRight ,
	identifier token trimRight ,
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
	^ insertQuery
]

{ #category : #rules }
MSQLGrammar >> dmlColumnIdentifier [
	^ tableIdentifier , $. asParser , columnIdentifier
]

{ #category : #rules }
MSQLGrammar >> domainIdentifier [
	^ identifier
]

{ #category : #rules }
MSQLGrammar >> dropTable [
	^ 'DROP' asParser trimRight , 'TABLE' asParser trimRight , tableIdentifier token
]

{ #category : #rules }
MSQLGrammar >> exceptClause [
	^ 'EXCEPT' asParser trimRight ,
	selectQuery token
]

{ #category : #rules }
MSQLGrammar >> expression [
	^ PPExpressionParser new
		term: (dmlColumnIdentifier / integerLiteral / booleanLiteral / nullLiteral);
		group: [ :group | "Arithmetic expressions."
			group left: ($+ asParser / $- asParser) trim do: [ :left :operator :right |
				{ left . operator . right }. self flag: #TODO ].
				group left: ($* asParser / $/ asParser) trim do: [ :left :operator :right |
				{ left . operator . right }. self flag: #TODO ] ];
		group: [ :group | "Boolean expressions."
			group prefix: 'NOT' asParser token trim do: [ :operator :exp | { operator . exp }. self flag: #TODO ].
			group left: ('AND' asParser / 'OR' asParser caseInsensitive) token trim do: [ :left :operator :right |
				{ left . operator . right }. self flag: #TODO ] ];
		yourself
]

{ #category : #'rules - literals' }
MSQLGrammar >> falseLiteral [
	^ 'FALSE' asParser
]

{ #category : #rules }
MSQLGrammar >> fromClause [
	^ 'FROM' asParser trimRight , (tableIdentifier token separatedBy: $, asParser trim)
]

{ #category : #rules }
MSQLGrammar >> identifier [
	^ #letter asParser , (#letter asParser / #digit asParser) star
]

{ #category : #rules }
MSQLGrammar >> insertQuery [
	^ 'INSERT' asParser trimRight ,
	'INTO' asParser trimRight ,
	tableIdentifier token trimRight ,
	$( asParser trimRight ,
		(columnIdentifier token separatedBy: $, asParser trim) ,
	$) asParser trimRight ,
	'VALUES' asParser trimRight ,
	(
		($( asParser trimRight , (tuple token separatedBy: $, asParser trim) , $) asParser trimLeft)
		/
		tuple token
	)
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
	^ 'SELECT' asParser trimRight
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
MSQLGrammar >> tuple [
	^ $( asParser trimRight ,
	(expression separatedBy: $, asParser trim) ,
	$) asParser trimLeft
]

{ #category : #rules }
MSQLGrammar >> unionClause [
	^ 'UNION' asParser trimRight ,
	selectQuery token
]

{ #category : #rules }
MSQLGrammar >> whereClause [
	^ 'WHERE' asParser trimRight , expression token
]
