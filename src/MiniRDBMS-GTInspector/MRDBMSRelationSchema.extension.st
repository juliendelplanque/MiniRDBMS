Extension { #name : #MRDBMSRelationSchema }

{ #category : #'*MiniRDBMS-GTInspector' }
MRDBMSRelationSchema >> gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 0> 
	^ (composite fastTable)
		title: 'Schema';
		display: [ self attributesToDomains associations ];
		column: 'Attribute' 
			evaluated: [:each | each key ];
		column: 'Domain' 
			evaluated: [:each | each value name ]
]
