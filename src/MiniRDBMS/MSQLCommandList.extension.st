Extension { #name : #MSQLCommandList }

{ #category : #'*MiniRDBMS' }
MSQLCommandList >> runOn: aMRDBMSDatabase [
	self acceptVisitor: (MRDBMSQueryRunner new
		database: aMRDBMSDatabase;
		yourself)
]
