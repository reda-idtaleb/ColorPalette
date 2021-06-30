"
I am a specific case of sequential colors; I can make a gradient of 3 colors.

More details and examples are coming
"
Class {
	#name : #ClPDivergingColors,
	#superclass : #ClPGeneratePalettes,
	#instVars : [
		'startingColor',
		'middleColor',
		'endingColor'
	],
	#category : #'ColorPalette-Palettes'
}

{ #category : #accessing }
ClPDivergingColors >> calculateStepsRGBBetween: startColor and: endColor [

	| collection stepR stepG stepB halfNumberColors|
	
	halfNumberColors := numberOfColors // 2.
	collection := OrderedCollection new.
	stepR := endColor red - startColor red / halfNumberColors.
	stepG := endColor green - startColor green / halfNumberColors.
	stepB := endColor blue - startColor blue / halfNumberColors.
	collection 
			add: stepR value; 
			add: stepG value; 	
			add: stepB value.
	^ collection
	
]

{ #category : #accessing }
ClPDivergingColors >> gradient [

	| stepsRGB1 stepsRGB2 colors |

	stepsRGB1 := self calculateStepsRGBBetween: startingColor and: middleColor. 
	stepsRGB2 := self calculateStepsRGBBetween: middleColor and: endingColor. 
	colors := self createColorsWith: stepsRGB1 and: stepsRGB2 .
	self generatedPalette: colors.
	^ colors
]

{ #category : #initialization }
ClPDivergingColors >> initialize [ 

	super initialize .
	startingColor := Color blue .
	middleColor := Color white.
	endingColor := Color black.
]

{ #category : #accessing }
ClPDivergingColors >> makePalette [

	GTInspector inspect: self gradient.
]
