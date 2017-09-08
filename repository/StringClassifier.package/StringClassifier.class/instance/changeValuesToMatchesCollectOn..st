accessing
changeValuesToMatchesCollectOn: aString
	^ (changeValuesToMatches ifNil: [ changeValuesToMatches := OrderedCollection new ])
		collect: [ :block | block value: aString ]