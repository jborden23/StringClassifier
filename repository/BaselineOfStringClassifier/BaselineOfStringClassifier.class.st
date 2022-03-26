Class {
	#name : #BaselineOfStringClassifier,
	#superclass : #BaselineOf,
	#category : #BaselineOfStringClassifier
}

{ #category : #baselines }
BaselineOfStringClassifier >> baseline: spec [
	"baselines"

	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec package: 'StringClassifier' with: [ spec requires: #() ] ]
]
