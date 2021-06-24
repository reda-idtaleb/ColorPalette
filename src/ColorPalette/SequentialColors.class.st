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

{ #category : #initialization }
SequentialColors >> initialize [ 

	super initialize.
	startingColor := Color white.
	endingColor := Color black
]
