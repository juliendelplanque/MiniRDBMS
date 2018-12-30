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
MSQLParser >> createTable [
	^ super createTable ==> [ :tokens |
		|petitTokens|
		petitTokens := tokens flattened select: [ :t | t class = PPToken ].
		MSQLCreateTable new
			tableIdentifier: petitTokens first parsedValue;
			columnDeclarations: petitTokens second parsedValue;
			yourself ]
]

{ #category : #rules }
MSQLParser >> identifier [
	^ super identifier ==> [ :tokens |
		MSQLIdentifier named: (String newFrom: tokens flattened) ]
]
