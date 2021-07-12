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
	self assert: palette last equals: Color black 
	
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
	
	| colorSelected |
	self createColors.
	self assert: palette currentColor equals: Color white .
	colorSelected := palette color: 2.
	self assert: palette currentColor equals: colorSelected  
]

{ #category : #tests }
PaletteTest >> testNextColor [
	
	| colorSelected |
	self createColors. 
	self assert: palette currentColor equals: Color white .
	self assert: palette nextColor equals: Color black.
	
	colorSelected := palette color: 2.
	self assert: palette currentColor equals: colorSelected .
	self assert: palette nextColor equals: (palette third).
	
	colorSelected := palette last.
	self assert: palette currentColor equals: colorSelected .
	self assert: palette nextColor equals: (palette first) 
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
