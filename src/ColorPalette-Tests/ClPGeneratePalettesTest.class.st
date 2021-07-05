Class {
	#name : #ClPGeneratePalettesTest,
	#superclass : #TestCase,
	#category : #'ColorPalette-Tests'
}

{ #category : #tests }
ClPGeneratePalettesTest >> testEuclideanDistanceBetweenAnd [

	self 
		assert: (ClPGeneratePalettes euclideanDistanceBetween: Color white and: Color white) 
		equals: 0.
]
