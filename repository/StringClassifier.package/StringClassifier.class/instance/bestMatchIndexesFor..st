testing
bestMatchIndexesFor: aCollection
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