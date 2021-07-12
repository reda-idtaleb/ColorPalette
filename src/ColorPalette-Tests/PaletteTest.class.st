Class {
	#name : #PaletteTest,
	#superclass : #TestCase,
	#instVars : [
		'palette'
	],
	#category : #'ColorPalette-Tests-Palette-Test'
}

{ #category : #tests }
PaletteTest >> createColors [
	
	palette 
		add: Color white;
		add: Color black;
		add: Color red.
		
]

{ #category : #running }
PaletteTest >> setUp [
	super setUp.
	
	palette := Palette new
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
PaletteTest >> testColorAt [
	
	self createColors .
	self assert:  (palette colorAt: 1) equals: Color white.
	self assert:  (palette colorAt: 2) equals: Color black.
	self assert:  (palette colorAt: -1) equals: Color red.
	self assert:  (palette colorAt: -2) equals: Color black.

	
]

{ #category : #tests }
PaletteTest >> testCurrentColor [
	
	| aChosenColor |
	self createColors.
	self assert: palette currentColor equals: palette first .
	aChosenColor := palette colorAt: 2.
	self assert: palette currentColor equals: aChosenColor  
]

{ #category : #tests }
PaletteTest >> testNextColor [
	
	| aChosenColor |
	self createColors. 
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
	self createColors. 
	self assert: palette currentColor equals: palette first .
	self assert: palette previousColor equals: palette last.
	
	colorSelected := palette colorAt: 2.
	self assert: palette currentColor equals: palette second .
	self assert: palette previousColor equals: palette first
]
