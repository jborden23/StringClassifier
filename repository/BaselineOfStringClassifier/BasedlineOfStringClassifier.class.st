Class {
	#name : #BasedlineOfStringClassifier,
	#superclass : #BaselineOf,
	#category : #BaselineOfStringClassifier
}

{ #category : #baselines }
BasedlineOfStringClassifier >> baseline: spec [
	"baselines"

	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec package: 'StringClassifier' with: [ spec requires: #() ] ]
]
