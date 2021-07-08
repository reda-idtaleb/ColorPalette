Class {
	#name : #ClPQualitativeColorsTest,
	#superclass : #TestCase,
	#category : #'ColorPalette-Tests'
}

{ #category : #tests }
ClPQualitativeColorsTest >> testEuclideanDistanceBetweenAnd [

	self 
		assert: (ClPQualitativeColors euclideanDistanceBetween: Color white and: Color white) 
		equals: 0.
]
