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

{ #category : #initialization }
ClpQualitativePaletteGenerator >> initialize [ 

	super initialize .
	startingColor := Color blue
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
