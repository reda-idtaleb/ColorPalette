Class {
	#name : #ClPQualitativeColorsTest,
	#superclass : #TestCase,
	#category : #'ColorPalette-Tests-GeneratePalettes-Test'
}

{ #category : #tests }
ClPQualitativeColorsTest >> testEuclideanDistanceBetweenAnd [

	self 
		assert: (ClPQualitativeColors euclideanDistanceBetween: Color white and: Color white) 
		equals: 0.
]
