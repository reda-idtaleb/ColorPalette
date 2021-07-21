Class {
	#name : #PaletteTest,
	#superclass : #TestCase,
	#instVars : [
		'palette'
	],
	#category : #'ColorPalette-Tests-Palette-Test'
}

{ #category : #running }
PaletteTest >> setUp [

	super setUp.

	palette := Palette new
		           add: Color white;
		           add: Color black;
		           add: Color red;
		           yourself
]

{ #category : #tests }
PaletteTest >> testAdd [
	
	palette add: Color white.
	self assert: palette first equals: Color white.
	palette add: Color black.
	self assert: palette last equals: Color black .
	
	self should: [palette add: 'notAColor'] raise: Error
	
]

{ #category : #tests }
PaletteTest >> testAddAll [
	
	| pal |
	pal := Palette new. 
	self assert: pal allColors isEmpty.
	pal addAll: { Color white. Color red }.
	self assert: pal allColors size equals: 2.
	self assert: pal first equals: Color white.
	self assert: pal last equals: Color red.

	self should: [ pal addAll: { 'notAColor' } ] raise: Error
]

{ #category : #tests }
PaletteTest >> testCheckAllElementsAreColors [
	
	self assert: (palette checkAllElementsAreColors: palette allColors). 
]

{ #category : #tests }
PaletteTest >> testColorAt [
	
	self assert:  (palette colorAt: 1) equals: Color white.
	self assert:  (palette colorAt: 2) equals: Color black.
	self assert:  (palette colorAt: 3) equals: Color red.

	
]

{ #category : #tests }
PaletteTest >> testCurrentColor [
	
	| aChosenColor |
	self assert: palette currentColor equals: palette first .
	aChosenColor := palette colorAt: 2.
	self assert: palette currentColor equals: aChosenColor  
]

{ #category : #tests }
PaletteTest >> testNextColor [
	
	| aChosenColor |
	self assert: palette currentColor equals: palette first .
	self assert: palette nextColor equals: palette second.
	
	aChosenColor := palette colorAt: 2.
	self assert: palette currentColor equals: aChosenColor .
	self assert: palette nextColor equals: palette third.
	
	aChosenColor := palette last.
	self assert: palette currentColor equals: aChosenColor .
	self assert: palette nextColor equals: palette first 
]

{ #category : #tests }
PaletteTest >> testPreviousColor [
	
	| colorSelected |
	self assert: palette currentColor equals: palette first .
	self assert: palette previousColor equals: palette last.
	
	colorSelected := palette colorAt: 2.
	self assert: palette currentColor equals: palette second .
	self assert: palette previousColor equals: palette first
]

{ #category : #tests }
PaletteTest >> testRemoveColor [
	
	| removedColor nonExistantColor |
	self assert: palette allColors size equals: 3. 
	removedColor := palette removeColor: palette allColors first.
	self assert: removedColor equals: Color white.
	self assert: palette allColors size equals: 2.
	self assert: palette allColors first equals: Color black .
	
	"remove a non-existent color"
	nonExistantColor := Color green.
	self assert: (palette removeColor: nonExistantColor) equals: 0.
	self assert: palette allColors size equals: 2.
	

]

{ #category : #tests }
PaletteTest >> testRemoveColorAt [
	
	| removedColor |
	self assert: palette allColors size equals: 3. 
	removedColor := palette removeColorAt: 1.
	self assert: removedColor equals: Color white.
	self assert: palette allColors size equals: 2.
	self assert: palette allColors first equals: Color black .
	

]

{ #category : #tests }
PaletteTest >> testReplaceColorAtBy [
	
	| newColor replacedColor |
	newColor := Color green.
	replacedColor := palette replaceColorAt: 1 by: newColor .
	self assert: replacedColor equals: newColor .
	self assert: palette allColors first equals: newColor .
	

]

{ #category : #tests }
PaletteTest >> testReplaceColorBy [
	
	| newColor replacedColor |
	newColor := Color green.
	replacedColor := palette replaceColor: palette first by: newColor .
	self assert: replacedColor equals: newColor .
	self assert: palette allColors first equals: newColor .
	

]
