Class {
	#name : #StringClassifierTest,
	#superclass : #TestCase,
	#category : 'StringClassifier-tests'
}

{ #category : #tests }
StringClassifierTest >> testBestMatch [
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
]

{ #category : #tests }
StringClassifierTest >> testBestMatchForMatches [
	| classifier |
	classifier := StringClassifier new.
	classifier
		addChangeValuesToMatches: [ :string | (string alike: 'FirstOne') / 3 ];
		addChangeValuesToMatches: [ :string | (string alike: 'second') / 3 ];
		addChangeValuesToMatches: [ :string | (string alike: '3rd') / 3 ].
	self
		assert: (classifier bestMatchIndexesFor: #('3rd' '3rd' 'FirstOne')) third equals: 1;
		assert: (classifier bestMatchIndexesFor: #('3rd' '3rd' 'FirstOne')) asSet size equals: 3;
		assert: (classifier bestMatchIndexesFor: #('secnd' 'secnd' 'FirstOne')) asSet size equals: 3;
		assert: (classifier bestMatchIndexesFor: #('secnd' 'FirstOne' 'FirstOne')) asSet size = 3
			description: 'Indexes should be unique'
]

{ #category : #tests }
StringClassifierTest >> testCollect [
	| classifier |
	classifier := StringClassifier new.
	self assert: (classifier changeValuesToMatchesCollectOn: 'test') isEmpty.
	classifier addChangeValuesToMatches: [ :string | 3 ].
	self
		deny: (classifier changeValuesToMatchesCollectOn: 'test') isEmpty;
		assert: (classifier changeValuesToMatchesCollectOn: 'test') first equals: 3
]
