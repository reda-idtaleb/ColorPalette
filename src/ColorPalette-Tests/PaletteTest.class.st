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

	self assert: (nonEmptyPalette colorAt: 1) equals: self colors first.
	self assert: (nonEmptyPalette colorAt: 2) equals: self colors second
]

{ #category : #tests }
PaletteTest >> testColorFor [
	
	
	emptyPalette addName: #red forColor: Color red. 
	emptyPalette addName: #white forColor: Color white. 
	
	self assert: (emptyPalette colorFor: #red) equals: Color red.
	self assert: (emptyPalette colorFor: #white) equals: Color white.
]
