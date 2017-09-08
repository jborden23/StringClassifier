tests
testCollect
	| classifier |
	classifier := StringClassifier new.
	self assert: (classifier changeValuesToMatchesCollectOn: 'test') isEmpty.
	classifier addChangeValuesToMatches: [ :string | 3 ].
	self
		deny: (classifier changeValuesToMatchesCollectOn: 'test') isEmpty;
		assert: (classifier changeValuesToMatchesCollectOn: 'test') first = 3