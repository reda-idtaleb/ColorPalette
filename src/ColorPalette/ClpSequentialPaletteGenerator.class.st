"
I am a generator of sequential palette. I take 2 different colors and i can make a gradient between them. Thr number of colors also must be given.

More details and examples are coming ...
"
Class {
	#name : #ClpSequentialPaletteGenerator,
	#superclass : #ClpPaletteGenerator,
	#instVars : [
		'startingColor',
		'endingColor'
	],
	#category : #'ColorPalette-GeneratePalettes'
}

{ #category : #accessing }
ClpSequentialPaletteGenerator >> calculateStepsRGBBetween: startColor and: endColor [

	| collection stepR stepG stepB |

	collection := OrderedCollection new.
	stepR := endColor red - startColor red / numberOfColors.
	stepG := endColor green - startColor green / numberOfColors.
	stepB := endColor blue - startColor blue / numberOfColors.
	collection 
			add: stepR value; 
			add: stepG value; 	
			add: stepB value.
	^ collection
	
]

{ #category : #private }
ClpSequentialPaletteGenerator >> generateColorsStartWith: aStartingColor respecting: stepsRGB [
	
	| colors |
	colors := OrderedCollection new.
	colors add: aStartingColor.
	(2 to: numberOfColors - 1) do: [ :i | 
		colors add: (Color
				 r: colors last red + stepsRGB first
				 g: colors last green + stepsRGB second
				 b: colors last blue + stepsRGB last) ].
	colors add: endingColor.		
	^ colors

]

{ #category : #accessing }
ClpSequentialPaletteGenerator >> gradient [

	| stepsRGB |
	stepsRGB := self
		            calculateStepsRGBBetween: startingColor
		            and: endingColor.
	^ self generateColorsStartWith: startingColor respecting: stepsRGB
]

{ #category : #initialization }
ClpSequentialPaletteGenerator >> initialize [ 

	super initialize.
	startingColor := Color white.
	endingColor := Color black
]

{ #category : #accessing }
ClpSequentialPaletteGenerator >> makeColors [
	 
	^ self gradient

	

	
]

{ #category : #accessing }
ClpSequentialPaletteGenerator >> startColor: aStartingColor endColor: anEndingColor [ 

	startingColor := aStartingColor .
	endingColor := anEndingColor .

	
 
]
