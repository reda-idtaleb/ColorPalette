"
I am a color palette. I am represented by a collection of colors in which you can access colors.

**Examples to select a color:**
```Smalltalk
p := Palette defaultColors.
p color: 1
```

```Smalltalk
p := Palette defaultColors.
p color: -1 	""the last color is returned""
```
"
Class {
	#name : #Palette,
	#superclass : #Object,
	#instVars : [
		'colors',
		'nextShift',
		'previousShift',
		'currentShift'
	],
	#category : #'ColorPalette-Palette'
}

{ #category : #adding }
Palette >> add: aColor [
	
	"add only a valid color to the collection"
	
	aColor isColor 
		ifTrue: [ colors add: aColor]
		ifFalse: [ ^ Error signal: 'The element added is not a valid Color' ]
							
]

{ #category : #accessing }
Palette >> colors [

	^ colors
]

{ #category : #initialization }
Palette >> initialize [ 

	super initialize .
	colors := OrderedCollection new.
	nextShift  := 1.
	previousShift := 1.
	currentShift := 1
]
