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
ClPDivergingColors >> gradient [

	| stepsRGB1 stepsRGB2 colors |

	stepsRGB1 := self calculateStepsRGBBetween: startingColor and: middleColor. 
	stepsRGB2 := self calculateStepsRGBBetween: middleColor and: endingColor. 
	colors := self createColorsWith: stepsRGB1 and: stepsRGB2 .
	self generatedPalette: colors.
	^ colors
]
