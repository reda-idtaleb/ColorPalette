"
I define some qualitative palette 
"
Class {
	#name : #FixedQualitativePalette,
	#superclass : #Object,
	#category : #'ColorPalette-FixedPalettes'
}

{ #category : #'accent-palette' }
FixedQualitativePalette >> qualitative15Colors [ 

	^  {  Color fromString: '#d4ac0d'.
        Color fromString: '#875692'.
        Color fromString: '#f38400'.
        Color fromString: '#a1caf1'.
        Color fromString: '#be0032'.
        Color fromString: '#008856'.
        Color fromString: '#e68fac'.
        Color fromString: '#0067a5'.
        Color fromString: '#f99379'.
        Color fromString: '#c2b280'.
        Color fromString: '#873600'.
        Color fromString: '#8db600'.
        Color fromString: '#f7dc6f'.
        Color fromString: '#48c9b0'.
        Color fromString: '#ff5050'}

]

{ #category : #'pastel-palette' }
FixedQualitativePalette >> qualitative15PastelColors [ 

	| colors |
	colors := OrderedCollection new.	
	self qualitative15Colors do: [ :each | 
		colors add: (each alphaMixed: 0.35 with: Color white) ]	.
	^ colors	

]

{ #category : #'accent-palette' }
FixedQualitativePalette >> qualitative22Colors [

	^  
	{ 
	Color fromString: '#ff00b6'.
	Color fromString: '#038246'.
	Color fromString: '#e6be00'.
	Color fromString: '#009fff'.
	Color fromString: '#9a4d42'.
	Color fromString: '#00ffbe'.
	Color fromString: '#783fc1'.
	Color fromString: '#1fb5b8'.
	Color fromString: '#ffacfd'.
	Color fromString: '#b1cc71'.
	Color fromString: '#de7693'.
	Color fromString: '#c8ff00'.
	Color fromString: '#ff9952'.
	Color fromString: '#93d4ff'.
	Color fromString: '#004cff'.
	Color fromString: '#84e19f'.
	Color fromString: '#f7ba9e'.
	Color fromString: '#a3cbcc'.
	Color fromString: '#a779e0'.
	Color fromString: '#978fa1'.
	Color fromString: '#fae170'.
	Color fromString: '#b09900'}
]

{ #category : #'pastel-palette' }
FixedQualitativePalette >> qualitative22PastelColors [

	| colors |
	colors := OrderedCollection new.	
	self qualitative22Colors do: [ :each | 
		colors add: (each alphaMixed: 0.35 with: Color white) ]	.
	^ colors	
]

{ #category : #'accent-palette' }
FixedQualitativePalette >> qualitative24Colors [

	^  
	{ 
	Color fromString: '#5a5156'.
	Color fromString: '#bbc9d9'.
	Color fromString: '#ff4d57'.
	Color fromString: '#8f3b3b'.
	Color fromString: '#3283fe'.
	Color fromString: '#feaf16'.
	Color fromString: '#e342a1'.
	Color fromString: '#1fecbf'.
	Color fromString: '#2bc6e8'.
	Color fromString: '#dea0fd'.
	Color fromString: '#aa0dfe'.
	Color fromString: '#f8a19f'.
	Color fromString: '#325a9b'.
	Color fromString: '#d97238'.
	Color fromString: '#469a75'.
	Color fromString: '#85660d'.
	Color fromString: '#61d485'.
	Color fromString: '#f7e1a0'.
	Color fromString: '#a779e0'.
	Color fromString: '#978fa1'.
	Color fromString: '#3b00fb'.
	Color fromString: '#b09900'.
	Color fromString: '#fbe426'.
	Color fromString: '#ed0000'}
]

{ #category : #'pastel-palette' }
FixedQualitativePalette >> qualitative24PastelColors [

	| colors |
	colors := OrderedCollection new.	
	self qualitative24Colors do: [ :each | 
		colors add: (each alphaMixed: 0.5 with: Color white) ]	.
	^ colors	
]
