tests
testBestMatch
	"Test the order of matches"
	| classifier |
	classifier := StringClassifier new.
	classifier addChangeValuesToMatches: [ :string | (string alike: 'Pablo') / 3 ].
	classifier addChangeValuesToMatches: [ :string | (string alike: 'cat') / 3 ].
	self
		assert: (classifier bestMatchIndexesFor: #('Peter' 'dog')) first equals: 1;
		assert: (classifier bestMatchIndexesFor: #('Peter' 'dog')) second equals: 2;
		should: [ classifier bestMatchIndexesFor: #('Peter') ] raise: SizeMismatch;
		assert: (classifier bestMatchIndexesFor: #('dog' 'Peter')) first = 2
			description: 'When arguments are switched, the indexes should be switched';
		assert: (classifier bestMatchIndexesFor: #('dog' 'Peter')) second = 1
			description: 'When arguments are switched, the indexes should also be switched'