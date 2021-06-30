"
I am a generator of sequential palette. I take 2 different colors and i can make a gradient between them. Thr number of colors also must be given.

More details and examples are coming ...
"
Class {
	#name : #ClPSequentialColors,
	#superclass : #ClPGeneratePalettes,
	#instVars : [
		'startingColor',
		'endingColor'
	],
	#category : #'ColorPalette-Palettes'
}

{ #category : #accessing }
ClPSequentialColors >> calculateStepsRGBBetween: startColor and: endColor [

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

{ #category : #accessing }
ClPSequentialColors >> create: aNumberOfColors colorsWith: stepsRGB beginWith: aStartingColor [
	
	| colors |
	colors := OrderedCollection new.
	colors add: aStartingColor.
	(2 to: aNumberOfColors - 1) do: [ :i | 
		colors add: (Color
				 r: colors last red + stepsRGB first
				 g: colors last green + stepsRGB second
				 b: colors last blue + stepsRGB last) ].
	^ colors

]

{ #category : #accessing }
ClPSequentialColors >> gradient: aNumberOfColors [

	| stepsRGB colors |
	stepsRGB := self calculateStepsRGBBetween: startingColor and: endingColor.
	colors := self create: aNumberOfColors colorsWith: stepsRGB beginWith: startingColor.
	colors add: endingColor.
	self generatedPalette: colors.
	^ colors
]

{ #category : #initialization }
ClPSequentialColors >> initialize [ 

	super initialize.
	startingColor := Color white.
	endingColor := Color black
]

{ #category : #accessing }
ClPSequentialColors >> makePalette [
	 
	GTInspector inspect: (self gradient: numberOfColors).

	

	
]

{ #category : #accessing }
ClPSequentialColors >> startColor: aStartingColor endColor: anEndingColor [ 

	startingColor := aStartingColor .
	endingColor := anEndingColor .

	
 
]
