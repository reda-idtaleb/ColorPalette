"
I am the qualitative palette, i can generate a qualitative palette from a starting a color specefied by the user.
"
Class {
	#name : #ClPQualitativeColors,
	#superclass : #ClPGeneratePalettes,
	#instVars : [
		'startingColor'
	],
	#category : #'ColorPalette-GeneratePalettes'
}

{ #category : #computing }
ClPQualitativeColors class >> euclideanDistanceBetween: aColor and: otherColor [
	
	"the formula is sqrt((r₁ - r₂)² + (g₁ - g₂)² + (b₁ - b₂)²)"
	
	| redDiff greenDiff blueDiff |
	redDiff := (otherColor red - aColor  red)**2.
	greenDiff := (otherColor green - aColor green)**2.
	blueDiff := (otherColor  blue - aColor blue)**2.
	^ (redDiff + greenDiff + blueDiff) sqrt
]

{ #category : #'as yet unclassified' }
ClPQualitativeColors >> generateAValidColorFrom: currentColor [

	"generate a different color from the currentColor"

	| nextColor |
	nextColor := self generateRandomColorFrom: startingColor.
	[self isValidColorBetween: currentColor and: nextColor] whileFalse: [ 
		nextColor := self generateRandomColorFrom: startingColor ].
	^ nextColor
]

{ #category : #'instance creation' }
ClPQualitativeColors >> generateRandomColorFrom: aColor [

	| red green blue |
	red := Random new nextBetween: 0 and: 255 .
	green := Random new nextBetween: 0 and: 255 .
	blue := Random new nextBetween: 0 and: 255 .
	
	red := (red + startingColor red)/2.
	green := (green + startingColor green)/2.
	blue := (blue + startingColor blue)/2.
	^  Color r: red g: green b: blue
]

{ #category : #initialization }
ClPQualitativeColors >> initialize [ 

	super initialize .
	startingColor := Color blue
]

{ #category : #testing }
ClPQualitativeColors >> isValidColor: aColor fromAll: collectionOfColors [
	
	"two colors are very similar if their distance is less than 0.1"
	
	^ collectionOfColors anySatisfy: [ :each | (each diff: aColor) < 0.1 ]
]

{ #category : #testing }
ClPQualitativeColors >> isValidColorBetween: originalColor and: chosenColor [

	"a valid color chosenColor is valid when it's different from the originalColor"
	
	^ (chosenColor diff: originalColor) >= 0.2
]

{ #category : #accessing }
ClPQualitativeColors >> makePalette [

	^ self qualitative.
]

{ #category : #'instance creation' }
ClPQualitativeColors >> qualitative [

	| wheel colors parts |
	colors := OrderedCollection new.
	wheel := self buildAWheel.
	parts := wheel size // numberOfColors.
	1 to: wheel size do: [ :i | 
		(i-1) % parts = 0  ifTrue: [ colors add: (wheel at: i) ] ].
	^ colors 
]

{ #category : #accessing }
ClPQualitativeColors >> startingColor: aColor [

	startingColor := aColor
]
