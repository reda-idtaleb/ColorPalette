"
I am the qualitative palette, i can generate a qualitative palette from a starting a color specefied by the user.
"
Class {
	#name : #ClPQualitativeColors,
	#superclass : #ClPGeneratePalettes,
	#instVars : [
		'startingColor'
	],
	#category : #'ColorPalette-Palettes'
}

{ #category : #initialization }
ClPQualitativeColors >> initialize [ 

	super initialize .
	startingColor := Color blue
]

{ #category : #accessing }
ClPQualitativeColors >> startingColor: aColor [

	startingColor := aColor
]
