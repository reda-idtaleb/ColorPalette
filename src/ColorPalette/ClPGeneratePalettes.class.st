"
I am a generator of palettes. 
Note: The number of colors to generate must be specified

More details and examples are coming ...
"
Class {
	#name : #ClPGeneratePalettes,
	#superclass : #Object,
	#instVars : [
		'numberOfColors'
	],
	#category : #'ColorPalette-Palettes'
}

{ #category : #computing }
ClPGeneratePalettes class >> euclideanDistanceBetween: aColor and: otherColor [

	| redDiff greenDiff blueDiff |
	redDiff := (aColor red - otherColor red)**2.
	greenDiff := (aColor green - otherColor green)**2.
	blueDiff := (aColor blue - otherColor blue)**2.
	^ (redDiff + greenDiff + blueDiff) 
]

{ #category : #testing }
ClPGeneratePalettes class >> isAbstract [
	
	^ self == ClPGeneratePalettes 
]

{ #category : #generating }
ClPGeneratePalettes >> generate [ 

	GTInspector inspect: self makePalette
]

{ #category : #'gt-inspection' }
ClPGeneratePalettes >> gtInspectorColorsIn: composite [
	<gtInspectorPresentationOrder: 0>
	
	^ composite fastTable
		title: 'Colors';
		display: [ self makePalette ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Index' evaluated: [ :color :idex | idex asString ] width: 50;
		column: 'Color' evaluated: [ :color | BorderedMorph new color: color ] width: 52;
		column: 'Code' evaluated: [ :color | GTObjectPrinter asTruncatedTextFrom: color asHexString asLowercase asSymbol ];
		send: [ :result | 
			result
				ifNil: [ nil ]
				ifNotNil: [ result size = 1
						ifTrue: [ result anyOne ]
						ifFalse: [ self species withAll: result ]
					]
			]
]

{ #category : #initialization }
ClPGeneratePalettes >> initialize [ 
	
	super initialize .
	numberOfColors := 20
]

{ #category : #accessing }
ClPGeneratePalettes >> makePalette [

	^ self subclassResponsibility 
]

{ #category : #accessing }
ClPGeneratePalettes >> numberOfColors [

	^ numberOfColors
]

{ #category : #accessing }
ClPGeneratePalettes >> numberOfColors: anInteger [

	numberOfColors := anInteger
]
