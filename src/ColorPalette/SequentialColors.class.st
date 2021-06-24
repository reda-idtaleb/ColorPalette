"
I am a generator of sequential palette 

More details and examples are comming ...
"
Class {
	#name : #SequentialColors,
	#superclass : #GeneratePalettes,
	#instVars : [
		'startingColor',
		'endingColor'
	],
	#category : #ColorPalette
}

{ #category : #accessing }
SequentialColors >> gradient: numberOfColors [
	
	| stepR stepG stepB colors |
	"self halt."
	
	stepR := (endingColor red - startingColor red) / numberOfColors.
	stepG := (endingColor green - startingColor green) / numberOfColors.
	stepB := (endingColor blue - startingColor blue) / numberOfColors.

	colors := OrderedCollection new.
	colors add: startingColor.

	(2 to: numberOfColors-1) do: [ :i |
    colors add: (Color
        r: ((colors last red) + stepR)
        g: ((colors last green) + stepG)
        b: ((colors last blue)+ stepB)) ].
    
	colors add: endingColor.
	^ colors


	
]

{ #category : #initialization }
SequentialColors >> initialize [ 

	super initialize.
	startingColor := Color white.
	endingColor := Color black
]

{ #category : #accessing }
SequentialColors >> makePalette: numberOfColors [
	
	"The integer represent the precision of the gradient"
	
	| colors |
	colors := self gradient: numberOfColors.
	"self halt."
	GTInspector inspect: (QualitativeColorPalette withColors: colors).

	

	
]

{ #category : #accessing }
SequentialColors >> startColor: aStartingColor endColor: anEndingColor [ 

	startingColor := aStartingColor .
	endingColor := anEndingColor .

	
 
]
