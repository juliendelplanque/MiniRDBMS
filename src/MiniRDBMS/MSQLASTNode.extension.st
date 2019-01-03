Extension { #name : #MSQLASTNode }

{ #category : #'*MiniRDBMS' }
MSQLASTNode >> runOn: aMRDBMSDatabase [
	self acceptVisitor: (MRDBMSQueryRunner new
		database: aMRDBMSDatabase;
		yourself)
]
