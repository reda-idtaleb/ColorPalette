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
PaletteTest >> testColor [
	
	self createColors .
	self assert:  (palette color: 1) equals: Color white.
	self assert:  (palette color: 2) equals: Color black.
	self assert:  (palette color: -1) equals: Color red.
	self assert:  (palette color: -2) equals: Color black.

	
]
