Trait {
	#name : #MRDBMSTErrorSignaler,
	#category : #'MiniRDBMS-Errors'
}

{ #category : #'error handling' }
MRDBMSTErrorSignaler >> domainError: aString [
	MRDBMSDomainError new
		signal: aString
]

{ #category : #'error handling' }
MRDBMSTErrorSignaler >> error: aString [
	MRDBMSError new
		signal: aString
]
