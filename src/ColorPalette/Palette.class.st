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
Palette >> color: index [
	
	"get a color specefied by its index. If the index is negative then indexing starts from the tail of the collection."
	
	index < 0 ifTrue: [ ^ colors at: index % (colors size + 1) ].
	currentShift := index.
	^ colors at: index
]

{ #category : #accessing }
Palette >> colors [

	^ colors
]

{ #category : #accessing }
Palette >> currentColor [
	
	"get the current color"

	^ self color: currentShift . 
	
]

{ #category : #accessing }
Palette >> first [ 
	
	^ self color: 1
]

{ #category : #initialization }
Palette >> initialize [ 

	super initialize .
	colors := OrderedCollection new.
	nextShift  := 1.
	previousShift := 1.
	currentShift := 1
]

{ #category : #accessing }
Palette >> last [
	
	^ self color: colors size
]

{ #category : #accessing }
Palette >> nextColor [
	
	"get the next color of the current color(use #currentColor) in the list of colors. If the current color is the last color, then the next color is the first color in the color list."
	
	| color |
	nextShift := currentShift + 1.
	nextShift > (colors size) ifTrue: [ nextShift := 1 ].
	color := self color: nextShift. 
	^ color
]

{ #category : #accessing }
Palette >> prevColor [
	
	"get the previous color of the current color(use #currentColor) in the list of colors"
	
	| color |
	previousShift := currentShift - 1.
	previousShift < 1 ifTrue: [ previousShift := colors size ].
	color := self color: previousShift. 
	^ color
]

{ #category : #accessing }
Palette >> second [ 
	
	^ self color: 2
]

{ #category : #accessing }
Palette >> third [
	
	^ self color: 3
]
