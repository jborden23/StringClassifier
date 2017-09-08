accessing
addChangeValuesToMatches: aBlock
	^ (changeValuesToMatches ifNil: [ changeValuesToMatches := OrderedCollection new ])
		add: aBlock