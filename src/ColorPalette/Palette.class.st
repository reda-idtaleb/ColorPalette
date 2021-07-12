"
I am a color palette. I am represented by a collection of colors in which you can access colors.

**Examples to select a color by it's index:**
```Smalltalk
p := Palette defaultColors.
p colorAt: 1
```

```Smalltalk
p := Palette defaultColors.
p colorAt: -1 	""the last color is returned""
```

**Examples to move between colors:**
```Smalltalk
p := Palette example24Colors.
p currentColor ""by default returns the first color in the list of colors in the palette"" 
```
You can get the next color:
```Smalltalk
p := Palette example24Colors.
p nextColor ""return the next color of the current color""
```

You can also get the previous color:
```Smalltalk
p := Palette example24Colors.
p previousColor ""return the previous color of the current color""
```
If you have chosen a color, so the current color is the selected color
```Smalltalk
p := Palette example24Colors.
p colorAt: 3. ""the 3rd color is chosen""
p currentColor. ""return the 3rd color""
p nextColor ""return the 4th color"" 
```

```Smalltalk
p := Palette example24Colors.
p colorAt: 3.
p currentColor. ""return the 3rd color""
p previousColor ""return the 2nd color""
```


**Get the collection of colors of the palette**
```Smalltalk
p := Palette example24Colors.
p allColors
```

"
Class {
	#name : #Palette,
	#superclass : #Object,
	#instVars : [
		'currentShift',
		'allColors'
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
Palette >> allColors [

	^ allColors
]

{ #category : #accessing }
Palette >> colorAt: index [

	"get a color specefied by its index. If the index is negative then indexing starts from the tail of the collection."
	
	index < 0 ifTrue: [ ^ allColors at: index % (allColors size + 1) ].
	currentShift := index.
	^ allColors at: index
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
Palette >> previousColor [
	
	"get the previous color of the current color(use #currentColor) in the list of colors"
	
	| color previousShift |
	previousShift := currentShift - 1.
	previousShift < 1 ifTrue: [ previousShift := allColors size ].
	color := self colorAt: previousShift. 
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
