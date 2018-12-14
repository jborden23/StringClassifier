"
I am used to classify strings into a small set of groups, based on a set of blocks.  My #bestMatchIndexesFor:  returns an array like #(3 1 2) to mean the first string is in group 3, the second in group 1, and the third in group 2.

    Instance Variables
	changeValuesToMatches:		<Collection of single argument blocks, value is a percent>

    The #addChangeValuesToMatch: blocks should grade the string for how close to a match it is, should return a positive number (0.0 to 1.0, but any positive number would work).

This is rather crude, better ML is on https://agileartificialintelligence.github.io
"
Class {
	#name : #StringClassifier,
	#superclass : #Object,
	#instVars : [
		'changeValuesToMatches'
	],
	#category : 'StringClassifier'
}

{ #category : #accessing }
StringClassifier >> addChangeValuesToMatches: aBlock [
	^ (changeValuesToMatches ifNil: [ changeValuesToMatches := OrderedCollection new ])
		add: aBlock
]

{ #category : #testing }
StringClassifier >> bestMatchIndexesFor: aCollection [
	| grades bestGrades |
	aCollection size = changeValuesToMatches size
		ifTrue: [ aCollection isEmpty
				ifTrue: [ CollectionIsEmpty signal ] ]
		ifFalse: [ SizeMismatch signal ].
	grades := Array new: aCollection size.
	bestGrades := Array new: aCollection size.
	aCollection
		withIndexDo: [ :string :index | grades at: index put: (self changeValuesToMatchesCollectOn: string) ].
	[ bestGrades contains: [ :e | e isNil ] ]
		whileTrue: [ | max maxRowIndex bestScore bestScoreIndex |
			maxRowIndex := bestScoreIndex := 1.
			max := (grades at: 1) at: 1.
			1 to: aCollection size do: [ :index | 
				bestScore := (grades at: index) max.
				max < bestScore
					ifTrue: [ max := bestScore.
						maxRowIndex := index.
						bestScoreIndex := (grades at: index) indexOf: bestScore ] ].
			bestGrades at: bestScoreIndex put: maxRowIndex.
			grades do: [ :scores | scores at: bestScoreIndex put: -100 ].
			grades at: maxRowIndex put: (Array new: aCollection size withAll: -100) ].
	^ bestGrades
]

{ #category : #accessing }
StringClassifier >> changeValuesToMatchesCollectOn: aString [
	^ (changeValuesToMatches ifNil: [ changeValuesToMatches := OrderedCollection new ])
		collect: [ :block | block value: aString ]
]
