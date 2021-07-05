Class {
	#name : #ClPSequentialColorsTest,
	#superclass : #TestCase,
	#instVars : [
		'sequentialPalette'
	],
	#category : #'ColorPalette-Tests'
}

{ #category : #running }
ClPSequentialColorsTest >> setUp [
	super setUp.
	
	sequentialPalette := ClPSequentialColors new 
]

{ #category : #tests }
ClPSequentialColorsTest >> testGradient [

	self assert: sequentialPalette gradient size equals: 20
	
]
