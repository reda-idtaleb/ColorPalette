Class {
	#name : #PaletteTest,
	#superclass : #TestCase,
	#instVars : [
		'emptyPalette',
		'nonEmptyPalette',
		'colors'
	],
	#category : #'ColorPalette-Tests-Palette-Test'
}

{ #category : #accessing }
PaletteTest >> classToTest [ 

	^ Palette
]

{ #category : #accessing }
PaletteTest >> colors [

	^ colors
]

{ #category : #running }
PaletteTest >> setUp [

	super setUp.
	colors := { Color white. Color black. Color red }.
	emptyPalette := self classToTest  new.
	nonEmptyPalette := self classToTest  
		                   withAll: colors
]

{ #category : #tests }
PaletteTest >> testAdd [
	
	| c1 c2 |
	c1 := Color green.
	c2 := Color brown.
	
	self assert: emptyPalette colorsDictionary isEmpty.

	emptyPalette add: c1.
	self assert: emptyPalette colorsDictionary size equals: 1.
	self assert: (emptyPalette colorAt: 1) equals: c1.
	emptyPalette add: c2.
	self assert: emptyPalette colorsDictionary size equals: 2.
	self assert: (emptyPalette colorAt: 2) equals: c2.

	self should: [ emptyPalette add: 'notAColor' ] raise: Error
]

{ #category : #tests }
PaletteTest >> testAddAll [
	
	| keyedCollection |
	self assert: emptyPalette colorsDictionary isEmpty.
	
	keyedCollection := { #snowyWhite -> Color white . #coolRed -> Color red darker }.
	emptyPalette addAll: keyedCollection .
	self assert: emptyPalette colorsDictionary size equals: keyedCollection size .
	self assert: (emptyPalette colorsDictionary includesAssociation: #snowyWhite -> Color white) . 
	self assert: (emptyPalette colorsDictionary includesAssociation: #coolRed -> Color red darker) . 

	self should: [ emptyPalette addAll: { 'notAColor' } ] raise: Error
]

{ #category : #tests }
PaletteTest >> testAddNameForColor [
	
	self assert: emptyPalette asCollection isEmpty.
	
	emptyPalette addName: #pink forColor: Color pink.
	self assert: emptyPalette colorsDictionary size equals: 1.
	self assert: (emptyPalette colorsDictionary includesAssociation: #pink -> Color pink).
	
	
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
