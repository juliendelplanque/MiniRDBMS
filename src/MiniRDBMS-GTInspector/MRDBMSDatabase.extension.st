Extension { #name : #MRDBMSDatabase }

{ #category : #'*MiniRDBMS-GTInspector' }
MRDBMSDatabase >> gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 0> 
	^ composite fastList
		title: 'Relations';
		display: [ self relations ];
		format: [ :each | each name ]
]
