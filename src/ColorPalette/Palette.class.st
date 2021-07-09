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

**Examples to move between colors:**
```Smalltalk
p := Palette defaultColors.
p nextColor
```

If you have chosen a color, so the current color is the selected color
```Smalltalk
p := Palette defaultColors.
p color: 3. ""select the third color""
p currentColor. ""return the 3rd color""
p nextColor ""return the 4th color"" 
```

```Smalltalk
p := Palette defaultColors.
p color: 3.
p currentColor. ""return the 3rd color""
p prevColor ""return the 2nd color""
```


**Get the collection of colors of the palette**
```Smalltalk
p := Palette defaultColors.
p colors
```

"
Class {
	#name : #Palette,
	#superclass : #Object,
	#instVars : [
		'colors',
		'currentShift',
		'nextShift',
		'previousShift'
	],
	#category : #'ColorPalette-Palette'
}

{ #category : #colors }
Palette class >> defaultColors [
	
	| palette |
	palette := self new 
		add: (Color fromString: '#4572a7');
		add: (Color fromString: '#c0504d');
		add: (Color fromString: '#9bbb28'); 
		add: (Color fromString: '#8064a2'); 
		add: (Color fromString: '#4bacc6');  
		add: (Color fromString: '#f79646');
		add: (Color fromString: '#fdd600');
		add: (Color fromString: '#2185ff');
		add: (Color fromString: '#ce3b37');
		add: (Color fromString: '#6bbd46');
		add: (Color fromString: '#834ec5');
		add: (Color fromString: '#21c1ed');
		add: (Color fromString: '#fa6d10');
		add: (Color fromString: '#fff114');
		add: (Color fromString: '#9db3d9');
		add: (Color fromString: '#db9d9d');
		add: (Color fromString: '#c2d7a1');
		add: (Color fromString: '#b4a7c8').
	^ palette
	
]

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
	
	"get the current color in the list of the colors"

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
