tests
testBestMatchForMatches
	| classifier |
	classifier := StringClassifier new.
	classifier
		addChangeValuesToMatches: [ :string | (string alike: 'FirstOne') / 3 ];
		addChangeValuesToMatches: [ :string | (string alike: 'secnd') / 3 ];
		addChangeValuesToMatches: [ :string | (string alike: '3rd') / 3 ].
	self
		assert: (classifier bestMatchIndexesFor: #('3rd' '3rd' 'FirstOne')) third equals: 1;
		assert: (classifier bestMatchIndexesFor: #('3rd' '3rd' 'FirstOne')) asSet size equals: 3;
		assert: (classifier bestMatchIndexesFor: #('secnd' 'secnd' 'FirstOne')) asSet size equals: 3;
		assert: (classifier bestMatchIndexesFor: #('secnd' 'FirstOne' 'FirstOne')) asSet size = 3
			description: 'Indexes should be unique'