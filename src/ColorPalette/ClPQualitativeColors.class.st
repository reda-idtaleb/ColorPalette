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
ClPQualitativeColors >> buildAWheelUpTo: endingColor [

	| wheel |	
	
	wheel := startingColor wheel: 60. "a segment of 180 units(colors)"
	wheel do: [ :each | 
		each = endingColor ifTrue: [ ^ wheel copyUpTo: each ]].
	^ wheel
		
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

	| endingColor wheel colors parts |
	colors := OrderedCollection new.
	endingColor := startingColor negated.
	wheel := self buildAWheelUpTo: endingColor.
	parts := wheel size // numberOfColors.
	1 to: wheel size do: [ :i | 
		(i-1) % parts = 0 ifTrue: [ colors add: (wheel at: i) ] ].
	^ colors
]

{ #category : #accessing }
ClPQualitativeColors >> startingColor: aColor [

	startingColor := aColor
]
