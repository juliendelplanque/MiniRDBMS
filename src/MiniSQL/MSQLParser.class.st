Class {
	#name : #MSQLParser,
	#superclass : #MSQLGrammar,
	#category : #'MiniSQL-Parser'
}

{ #category : #rules }
MSQLParser >> alterTableAddFKConstraint [
	^ super alterTableAddFKConstraint ==> [ :tokens |
		|petitTokens|
		petitTokens := tokens flattened select: [ :o | o class = PPToken ].
		MSQLAlterTableAddFKConstraint new
			tableIdentifier: petitTokens first parsedValue;
			columnIdentifiers: (petitTokens allButFirst allButLast collect: #parsedValue);
			referencedTableIdentifier: (petitTokens last parsedValue);
			yourself ]
]

{ #category : #rules }
MSQLParser >> alterTableAddPKConstraint [
	^ super alterTableAddPKConstraint ==> [ :tokens |
		|petitTokens|
		petitTokens := tokens flattened select: [ :o | o class = PPToken ].
		MSQLAlterTableAddPKConstraint new
			tableIdentifier: petitTokens first parsedValue;
			columnIdentifiers: (petitTokens allButFirst collect: #parsedValue);
			yourself ]
]

{ #category : #rules }
MSQLParser >> columnDeclaration [
	^ super columnDeclaration ==> [ :petitTokens |
		MSQLColumnDeclaration new
			columnIdentifier: petitTokens first parsedValue;
			domainIdentifier: petitTokens second parsedValue;
			yourself ]
]

{ #category : #rules }
MSQLParser >> columnIdentifier [
	^ super columnIdentifier ==> #asColumnIdentifier
]

{ #category : #rules }
MSQLParser >> createTable [
	^ super createTable ==> [ :tokens |
		|petitTokens|
		petitTokens := tokens flattened select: [ :t | t class = PPToken ].
		MSQLCreateTable new
			tableIdentifier: petitTokens first parsedValue;
			columnDeclarations: (petitTokens allButFirst collect: #parsedValue);
			yourself ]
]

{ #category : #rules }
MSQLParser >> domainIdentifier [
	^ super domainIdentifier ==> #asDomainIdentifier
]

{ #category : #rules }
MSQLParser >> dropTable [
	^ super dropTable ==> [ :tokens |
		MSQLDropTable new
			tableIdentifier: (tokens detect: [ :o | o class = PPToken ]) parsedValue;
			yourself ]
]

{ #category : #'rules - literals' }
MSQLParser >> falseLiteral [
	^ super falseLiteral ==> [ :tokens |
		MSQLFALSELitteral new ]
]

{ #category : #rules }
MSQLParser >> identifier [
	^ super identifier ==> [ :tokens |
		MSQLIdentifier named: (String newFrom: tokens flattened) ]
]

{ #category : #rules }
MSQLParser >> insertQuery [
	^ super insertQuery ==> [ :tokens |
		MSQLInsertQuery new
			tableIdentifier: tokens third parsedValue;
			columnIdentifiers: (tokens fifth reject: #isCharacter thenCollect: #parsedValue);
			tuples: (tokens last asOrderedCollection flattened reject: #isCharacter thenCollect: #parsedValue);
			yourself ]
]

{ #category : #'rules - literals' }
MSQLParser >> integerLiteral [
	^ super integerLiteral ==> [ :tokens |
		MSQLIntegerLitteral integerString: (String newFrom: (tokens flattened reject: #isNil)) ]
]

{ #category : #'rules - literals' }
MSQLParser >> nullLiteral [
	^ super nullLiteral ==> [ :tokens |
		MSQLNULLLitteral new ]
]

{ #category : #rules }
MSQLParser >> tableIdentifier [
	^ super tableIdentifier ==> #asTableIdentifier
]

{ #category : #'rules - literals' }
MSQLParser >> trueLiteral [
	^ super trueLiteral ==> [ :tokens |
		MSQLTRUELitteral new ]
]

{ #category : #rules }
MSQLParser >> tuple [
	^ super tuple ==> [ :tokens |
		MSQLTuple new
			expressions: (tokens second reject: #isCharacter);
			yourself ]
]
