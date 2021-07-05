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

{ #category : #'instance creation' }
ClPQualitativeColors >> buildAWheel [
	
	^ startingColor wheel: 50 "a segment of 50 units(colors)"
	
		
]

{ #category : #initialization }
ClPQualitativeColors >> initialize [ 

	super initialize .
	startingColor := Color blue
]

{ #category : #accessing }
ClPQualitativeColors >> makePalette [

	^ self qualitative.
]

{ #category : #'instance creation' }
ClPQualitativeColors >> qualitative [

	| wheel colors parts |
	colors := OrderedCollection new.
	wheel := self buildAWheel.
	parts := wheel size // numberOfColors.
	1 to: wheel size do: [ :i | 
		(i-1) % parts = 0  ifTrue: [ colors add: (wheel at: i) ] ].
	^ colors 
]

{ #category : #accessing }
ClPQualitativeColors >> startingColor: aColor [

	startingColor := aColor
]
