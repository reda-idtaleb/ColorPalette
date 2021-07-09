Class {
	#name : #PaletteTest,
	#superclass : #TestCase,
	#instVars : [
		'palette'
	],
	#category : #'ColorPalette-Tests-Palette-Test'
}

{ #category : #tests }
PaletteTest >> testAdd [
	
	palette add: Color white.
	self assert: palette first equals: Color white.
	palette add: Color black.
	self assert: palette last equals: Color black 
	
]
