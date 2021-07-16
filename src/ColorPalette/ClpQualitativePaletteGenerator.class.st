"
I am the qualitative palette, i can generate a qualitative palette from a starting a color specefied by the user.
"
Class {
	#name : #ClpQualitativePaletteGenerator,
	#superclass : #ClpPaletteGenerator,
	#instVars : [
		'startingColor'
	],
	#category : #'ColorPalette-GeneratePalettes'
}

{ #category : #private }
ClpQualitativePaletteGenerator >> generateADifferentColorFrom: currentColor [

	"generate a different color from the currentColor"

	| nextColor |
	nextColor := self generateRandomColorFrom: startingColor .
	[ self isChosenColor: nextColor differentFrom: currentColor ] 
		whileFalse: [ 
		nextColor := self generateRandomColorFrom: startingColor  ].
	^ nextColor
]

{ #category : #private }
ClpQualitativePaletteGenerator >> generateRandomColorFrom: aColor [

	| red green blue |
	red := Random new nextBetween: 0 and: 255 .
	green := Random new nextBetween: 0 and: 255 .
	blue := Random new nextBetween: 0 and: 255 .
	
	red := (red + aColor red)/2.
	green := (green + aColor green)/2.
	blue := (blue + aColor blue)/2.
	^  Color r: red g: green b: blue
]

{ #category : #initialization }
ClpQualitativePaletteGenerator >> initialize [ 

	super initialize .
	startingColor := Color blue
]

{ #category : #testing }
ClpQualitativePaletteGenerator >> isChosenColor: chosenColor differentFrom: originalColor [

	"return if the chosenColor is defferent from the originalColor"
	
	^ (chosenColor diff: originalColor) >= 0.2
]

{ #category : #testing }
ClpQualitativePaletteGenerator >> isChosenColorDifferent: aColor fromAll: collectionOfColors [
	
	"return true if aColor is different from all the others colors in the collection of colors"
	
	^ collectionOfColors anySatisfy: [ :each | (aColor diff: each) <= 0.1 ]
]

{ #category : #accessing }
ClpQualitativePaletteGenerator >> makeColors [
	
	^ self qualitative
]

{ #category : #'instance creation' }
ClpQualitativePaletteGenerator >> qualitative [

	"I create a collection of colors"

	| colors currentColor nextColor |
	colors := OrderedCollection new.
	currentColor := startingColor.
	colors add: currentColor.
	2 to: numberOfColors do: [ :i | 
		[ self isChosenColorDifferent: currentColor fromAll: colors ] whileTrue: [ 
			nextColor := self generateADifferentColorFrom: currentColor .
			currentColor := nextColor ].
		colors add: nextColor.
		currentColor := nextColor ].
	^ colors
]

{ #category : #accessing }
ClpQualitativePaletteGenerator >> startingColor: aColor [

	startingColor := aColor
]
