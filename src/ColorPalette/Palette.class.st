"
I am a color palette. I am represented by a dictionary of colors in which you can access colors.
When you want to add a color in the dictionary use **#add: aColor**, which adds a color whose key is an index (by default) generated automatically in the dictionary.

**Add as many colors as you want:**
```Smalltalk
p := Palette new .
p add: Color red;
  add: Color lightBlue
```

Use **#addName:forColor:** to add a color as a value with a name as a key.

**To select a color by its index, Use #colorAt: only if the keys are indices:**
```Smalltalk
p := Palette example24Colors.
p colorAt: 1
```

**To move between colors:**
```Smalltalk
p := Palette example24Colors.
p currentColor ""by default returns the first color in the list of colors in the palette"" 
```
**You can get the next color:**
```Smalltalk
p := Palette example24Colors.
p nextColor ""return the next color of the current color""
```

**You can also get the previous color:**
```Smalltalk
p := Palette example24Colors.
p previousColor ""return the previous color of the current color""
```
If you have chosen a color, so the current color is the selected color
```Smalltalk
p := Palette example24Colors.
p colorAt: 3. ""the 3rd color is chosen""
p currentColor. ""return the 3rd color""
p nextColor. ""return the 4th color"" 
p currentColor ""return the 4th color""
```

**Use #withAll: to add a collection of colors, so that the keys are the indexes of each color according to their order in the collection.**
```Smalltalk
p := Palette withAll: { Color red. Color blue. Color green }
```
**Get the collection of colors of the palette**
```Smalltalk
p := Palette example24Colors.
p asCollection
```

"
Class {
	#name : #Palette,
	#superclass : #Object,
	#instVars : [
		'colorsDictionary',
		'index'
	],
	#category : #'ColorPalette-Palette'
}

{ #category : #colors }
Palette class >> example24Colors [
	
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
		add: (Color fromString: '#b4a7c8');
		add: (Color fromString: '#9dd9d4');
		add: (Color fromString: '#d9b99d');
		add: (Color fromString: '#d9d19d');
		add: (Color fromString: '#ffffff');
		add: (Color fromString: '#000000');
		add: (Color fromString: '#9c9c9c').
	^ palette
	
]

{ #category : #adding }
Palette >> add: aColor [

	"I add a color whose key is an index to the dictionary of colors. Only an instance of Color is allowed"

	aColor value isColor
		ifTrue: [ 
			colorsDictionary add: index -> aColor.
			self updateIndexColor: index + 1 ]
		ifFalse: [ ^ Error signal: 'The element added is not a valid Color' ]
]

{ #category : #adding }
Palette >> addAll: aKeyedCollectionOfColors [

	"I take a keyed collection of colors and i add all its pairs (key->value) to the colorsDictionary"
	
	| collectionAsOrderedDictionary |
	collectionAsOrderedDictionary := aKeyedCollectionOfColors asOrderedDictionary .
	(self class checkAllElementsAreColors: collectionAsOrderedDictionary)
		ifTrue: [ 
			collectionAsOrderedDictionary associationsDo: [ :each | 
				self colorsDictionary add: each key -> each value ] ]
		ifFalse: [ Error signal: 'Not all elements are instance of Color' ]
]

{ #category : #adding }
Palette >> addName: aName forColor: color [
	
	"add a name for a color to the dictionary of colors"
	
	colorsDictionary add: aName -> color.
	self updateIndexColor: (self colorsDictionary indexOfKey: aName).
]

{ #category : #accessing }
Palette >> asCollection [

	^ colorsDictionary values
]

{ #category : #private }
Palette >> checkAllElementsAreColors: aCollectionOfColors [
	
	"private. check if all the elements of the collection are an instance of Color"
	
	^ aCollectionOfColors allSatisfy: [ :each | each isColor ]
							
]

{ #category : #'color manipulation' }
Palette >> colorAt: index [

	"get a color specefied by its index. If the index is negative then indexing starts from the tail of the collection."

	self updateCurrentColor: index.
	^ allColors at: index
]

{ #category : #'palette-variant' }
Palette >> darkerPalette [
	
	"returns the same palette but containing darker colors"
	
	| darkerColors |
	darkerColors := allColors collect: [ :c |  c adjustBrightness: -0.3 ].
	self allColors reset.
	^ self 
		addAll: darkerColors;
		yourself
]

{ #category : #accessing }
Palette >> first [ 
	
	^ self colorAt: 1
]

{ #category : #initialization }
Palette >> initialize [ 

	super initialize .
	allColors := OrderedCollection new.
	currentShift := 1
]

{ #category : #accessing }
Palette >> last [
	
	^ self colorAt: allColors size
]

{ #category : #'palette-variant' }
Palette >> lighterPalette [
	
	"returns the same palette but containing darker colors"
	
	| lighterColors |
	lighterColors := allColors collect: [ :c | 
		                 c saturation >= 0.4
			                 ifTrue: [ c adjustSaturation: -0.4 brightness: 0.08 ]
			                 ifFalse: [ c adjustSaturation: -0.08 brightness: 0.08 ] ].
	self allColors reset.
	^ self
		  addAll: lighterColors;
		  yourself
]

{ #category : #removing }
Palette >> removeColor: color [
	
	"remove a color specified by its index from the collection of colors "
	
	^ self allColors remove: color ifAbsent: [ ^ 0 ]
]

{ #category : #'color manipulation' }
Palette >> replaceColor: oldColor by: newColor [

	"replace a color oldColor by a new color newColor. This method modify the collection of colors and returns the newColor"
	
	(oldColor isColor and: newColor isColor) ifFalse: [ ^ Error signal: 'Only replace by an instance of Color' ].
	^ allColors at: (allColors indexOf: oldColor ifAbsent: [^ 0]) put: newColor
	
	
	

]

{ #category : #'color manipulation' }
Palette >> replaceColorAt: anIndex by: newColor [

	"replace a color specified by its index anIndex by a new color newColor. This method modify the collection of colors and returns the newColor"
	
	newColor isColor ifFalse: [ ^ Error signal: 'Only replace by an instance of Color' ].
	^ allColors at: anIndex put: newColor
	
	
	

]

{ #category : #accessing }
Palette >> second [ 
	
	^ self colorAt: 2
]

{ #category : #accessing }
Palette >> third [
	
	^ self colorAt: 3
]
