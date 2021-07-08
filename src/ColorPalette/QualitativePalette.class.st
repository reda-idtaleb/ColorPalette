"
I can extract colors from predefined qualitative palettes. The extracted colors are all distinct.

**Examples: extracting a palette**
```Smalltalk
""you can choose up to 52 colors, but the maximum recommended number is 30""
QualitativePalette fromAccentPaletteGet: 15
```

```Smalltalk
""you can choose up to 30 colors""
QualitativePalette fromPastelPaletteGet: 15
```

**Examples: take some first colors of palette**
```Smalltalk
QualitativePalette takeFromAccentFirstColors: 10 
```

```Smalltalk
QualitativePalette takeFromPastelFirstColors: 10
```

**Examples: mixing pastel and accent colors to have more variety**
```Smalltalk
QualitativePalette new
	numberOfColors: 10;
	mixPastelWithAccent  ""get a constant palette with 50% of pastel and 50% of accent colors""
```

```Smalltalk
QualitativePalette new
	numberOfColors: 10;
	mixPastelWithAccentRandomly ""get a random palette with 50% of pastel and 50% of accent colors""
```

```Smalltalk
QualitativePalette new
	numberOfColors: 10;
	mixPastelWithAccentUpTo: 0.4  ""40% of colors are pastel""
```
**Examples: get full palettes**
```Smalltalk
""A palette of 52 colors""
QualitativePalette pastelPalette
```

```Smalltalk
""A palette of 30 colors""
QualitativePalette accentPalette
```

**Examples: palette of 15 colors**
```Smalltalk
QualitativePalette accent15Colors
```
```Smalltalk
QualitativePalette pastel15Colors
```

**Examples: palette of 22 colors**
```Smalltalk
QualitativePalette accent22Colors
```
```Smalltalk
QualitativePalette pastel22Colors
```

**Examples: palette of 24 colors**
```Smalltalk
QualitativePalette accent24Colors
```
```Smalltalk
QualitativePalette pastel24Colors
```


"
Class {
	#name : #QualitativePalette,
	#superclass : #Object,
	#instVars : [
		'numberOfColors',
		'palettes',
		'generetedPalette'
	],
	#category : #'ColorPalette-FixedPalettes'
}

{ #category : #'accent-palette' }
QualitativePalette class >> accent15Colors [

	^ self new palettes qualitative15Colors 
]

{ #category : #'accent-palette' }
QualitativePalette class >> accent22Colors [

	^ self new palettes qualitative22Colors 
]

{ #category : #'accent-palette' }
QualitativePalette class >> accent24Colors [

	^ self new palettes qualitative24Colors 
]

{ #category : #'extracting-palette' }
QualitativePalette class >> fromAccentPaletteGet: aNumberOfColors [
	
	"extract a number of colors aNumberOfColors from a predefined accent palette with 52 most distinguished colors"
	| accentPalette colors dividePastel |
	accentPalette := self new accentPalette.
	dividePastel := accentPalette size // aNumberOfColors.
	colors := OrderedCollection new.
	accentPalette do: [ :each | 
		((accentPalette indexOf: each) % dividePastel = 0 and:
			 colors size < aNumberOfColors) ifTrue: [ colors add: each ] ].
	^ colors
]

{ #category : #'extracting-palette' }
QualitativePalette class >> fromPastelPaletteGet: aNumberOfColors [
	
	"extract a number of colors aNumberOfColors from a predefined pastel palette with 30 most distinguished colors"
	
	| pastel colors dividePastel |
	pastel := self new pastelPalette.
	dividePastel := pastel size // aNumberOfColors.
	colors := OrderedCollection new.
	pastel do: [ :each | 
		((pastel indexOf: each) % dividePastel = 0 and:
			 colors size < aNumberOfColors) ifTrue: [ colors add: each ] ].
	^ colors
]

{ #category : #'pastel-palette' }
QualitativePalette class >> pastel15Colors [

	^ self new palettes qualitative15PastelColors 
]

{ #category : #'pastel-palette' }
QualitativePalette class >> pastel22Colors [

	^ self new palettes qualitative22PastelColors 
]

{ #category : #'pastel-palette' }
QualitativePalette class >> pastel24Colors [

	^ self new palettes qualitative24PastelColors 
]

{ #category : #'extracting-palette' }
QualitativePalette class >> takeFromAccentFirstColors: aNumberOfColors [ 

	^ self new accentPalette copyFrom: 1 to: aNumberOfColors .
]

{ #category : #'extracting-palette' }
QualitativePalette class >> takeFromPastelFirstColors: aNumberOfColors [ 

	^ self new pastelPalette copyFrom: 1 to: aNumberOfColors .
]

{ #category : #palettes }
QualitativePalette >> accentPalette [
	
	"get a palette with the most distinct accent colors"
	
	| accentColors |
	accentColors := OrderedCollection new.
	accentColors 
		addAll: palettes qualitative24Colors;
		addAll: palettes qualitative22Colors;
		addAll: palettes qualitative15Colors.
	^ self onlyDistinctColorFrom: accentColors
]

{ #category : #private }
QualitativePalette >> filterSimilarColor: aColor fromAll: colors [

	"two colors are very similar when their distances is less than 0.05"

	^ colors anySatisfy: [ :each | (each diff: aColor) < 0.05  ]
]

{ #category : #initialization }
QualitativePalette >> initialize [ 

	super initialize .
	numberOfColors := 15.
	palettes := FixedQualitativePalette new.
]

{ #category : #palettes }
QualitativePalette >> mixPastelWithAccent [

	"make a palette with a mix between pastel colors and accent colors. Then the pastel colors will take 50% of the total size of the palette. The palette should provide distinguished colors"
	
	| pastel accent colors |
	colors := OrderedCollection new.
	pastel := self pastelPalette.
	accent := self accentPalette. 
	1 to: numberOfColors do: [  :i |
		i even 
			ifTrue: [ colors add: (pastel at: i) ] 
			ifFalse: [ colors add: (accent at: i) ] ].
	^ colors	 
]

{ #category : #palettes }
QualitativePalette >> mixPastelWithAccentRandomly [

	"make a palette by mixing randomly pastel colors and accent colors. The pastel colors will take 50% of the total size of the palette. The palette should provide distinguished colors"
	
	| pastel accent colors |
	colors := OrderedCollection new.
	pastel := self pastelPalette.
	accent := self accentPalette. 
	1 to: numberOfColors do: [  :i |
		i even 
			ifTrue: [ 
				| randomPastel |
				randomPastel := Random new nextIntegerBetween: 1 and: pastel size. 
				colors add: (pastel at: randomPastel).
				pastel removeAt: randomPastel ] 
			ifFalse: [ 
				| randomAccent |
				randomAccent := Random new nextIntegerBetween: 1 and: accent size.
				colors add: (accent at: randomAccent).
				accent removeAt: randomAccent ] ].
	^ colors	 
]

{ #category : #palettes }
QualitativePalette >> mixPastelWithAccentUpTo: aPercentage [

	"make a palette with a mix between pastel colors and accent colors. Then the pastel colors will take a percentage(of range [0, 1] of the total size of the palette. The palette should provide distinguished colors"
	
	| pastel accent numberOfPastelColors numberOfAccentColors colors countPastelColors countAccentColors |
	colors := OrderedCollection new.
	pastel := self pastelPalette.
	accent := self accentPalette. 
	numberOfPastelColors := (numberOfColors * aPercentage) asInteger.
	numberOfAccentColors := numberOfColors - numberOfPastelColors.
	countPastelColors := 0.
	countAccentColors := 0.
	1 to: numberOfColors + 1 do: [  :i |
		i even 
			ifTrue: [ 
				countPastelColors < numberOfPastelColors ifTrue: [ 
					colors add: (pastel at: i).
					countPastelColors := countPastelColors + 1 ]	] 
			ifFalse: [ 
				countAccentColors < numberOfAccentColors ifTrue: [ 
					colors add: (accent at: i).
					countAccentColors := countAccentColors + 1 ]
				 ] ].
	^ colors	 
]

{ #category : #accessing }
QualitativePalette >> numberOfColors: anInteger [

	numberOfColors := anInteger 
]

{ #category : #private }
QualitativePalette >> onlyDistinctColorFrom: aCollectionOfColor [
	
	"extract the most distinct colors from a collection of colors"
	| currentColor colors |
	colors := OrderedCollection new.
	currentColor := aCollectionOfColor first.
	colors add: currentColor.
	2 to: aCollectionOfColor size do: [ :indexNextColor |
		| nextColor |
		nextColor := aCollectionOfColor at: indexNextColor.
		(colors last diff: nextColor) < 0.05
			ifFalse: [ 
				(self filterSimilarColor: nextColor fromAll: colors) ifFalse: [ 
					colors add: nextColor ] ].
		currentColor := nextColor ].
	^ colors
]

{ #category : #palettes }
QualitativePalette >> pastelPalette [
	
	"get a pastel of palette with the most distinct colors"
	
	| pastelColors |
	pastelColors := OrderedCollection new.
	pastelColors 
		addAll: palettes qualitative24PastelColors;
		addAll: palettes qualitative22PastelColors;
		addAll: palettes qualitative15PastelColors.
	^ self onlyDistinctColorFrom: pastelColors
]
