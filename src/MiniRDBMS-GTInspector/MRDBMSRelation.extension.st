Extension { #name : #MRDBMSRelation }

{ #category : #'*MiniRDBMS-GTInspector' }
MRDBMSRelation >> gtInspectorSchemaIn: composite [
	<gtInspectorPresentationOrder: 0> 
	^ self relationSchema gtInspectorItemsIn: composite
]

{ #category : #'*MiniRDBMS-GTInspector' }
MRDBMSRelation >> gtInspectorTuplesIn: composite [
	<gtInspectorPresentationOrder: 1> 
	| panel |
	panel := (composite fastTable)
		title: 'Tuples';
		display: [ self tuples ].
		
	self relationSchema attributeNames do: [ :attributeName |
		panel
			column: attributeName 
			evaluated: [:tuple | tuple at: attributeName withSchema: self relationSchema  ] ].
			
	^ panel
]
