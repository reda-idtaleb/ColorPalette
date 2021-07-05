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
ClPDivergingColors class >> indexOfTheMiddleColor: aNumberOfColors [

	| index |
	^ index := aNumberOfColors even
		           ifTrue: [ aNumberOfColors // 2 ]
		           ifFalse: [ aNumberOfColors // 2 + 1 ]
]

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
ClPDivergingColors >> createColorsWith: stepsRGB1 and: stepsRGB2 [

	| colors indexMiddleColor |
	indexMiddleColor := self class indexOfTheMiddleColor: numberOfColors.
	colors := OrderedCollection new.
	colors add: startingColor.
	2 to: numberOfColors - 1 do: [ :i | 
		i < indexMiddleColor ifTrue: [ 
			colors add: (Color
					 r: colors last red + stepsRGB1 first
					 g: colors last green + stepsRGB1 second
					 b: colors last blue + stepsRGB1 last) ].
		i = indexMiddleColor ifTrue: [ colors add: middleColor ].
		i > indexMiddleColor ifTrue: [ 
			colors add: (Color
					 r: colors last red + stepsRGB2 first
					 g: colors last green + stepsRGB2 second
					 b: colors last blue + stepsRGB2 last) ] ].
	colors add: endingColor.
	^ colors
]

{ #category : #initialization }
ClPDivergingColors >> initialize [ 

	super initialize .
	startingColor := Color blue .
	middleColor := Color white.
	endingColor := Color red.
]

{ #category : #accessing }
ClPDivergingColors >> makePalette [

	| stepsRGB1 stepsRGB2 colors |

	stepsRGB1 := self calculateStepsRGBBetween: startingColor and: middleColor. 
	stepsRGB2 := self calculateStepsRGBBetween: middleColor and: endingColor. 
	colors := self createColorsWith: stepsRGB1 and: stepsRGB2 .
	^ colors
]

{ #category : #accessing }
ClPDivergingColors >> s: aStartingColor e: anEndingcolor [
	
	startingColor := aStartingColor .
	endingColor := anEndingcolor 
]

{ #category : #accessing }
ClPDivergingColors >> s: aStartinColor m: aMiddleColor e: anEndingColor [

	startingColor := aStartinColor .
	middleColor := aMiddleColor.
	endingColor := anEndingColor 
]
