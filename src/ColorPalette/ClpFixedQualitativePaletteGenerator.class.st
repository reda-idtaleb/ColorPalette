"
I am a fixed qualitative palette generator. I can extract colors from predefined qualitative palettes. The extracted colors are all distinct.

**Note: You can choose until 24 colors**

Example:
```Smalltalk
ClpFixedQualitativePaletteGenerator 
	generate: 10  ""generate a palette of 10 colors from a predefined collection of colors""
```
"
Class {
	#name : #ClpFixedQualitativePaletteGenerator,
	#superclass : #ClpQualitativePaletteGenerator,
	#category : #'ColorPalette-GeneratePalettes'
}

{ #category : #examples }
ClpFixedQualitativePaletteGenerator class >> example16AccentColors [

	self sample16AccentColors asCollection inspect
]

{ #category : #examples }
ClpFixedQualitativePaletteGenerator class >> example20AccentColors [

	self sample20AccentColors asCollection inspect
]

{ #category : #examples }
ClpFixedQualitativePaletteGenerator class >> example24AccentColors [

	self sample24AccentColors asCollection inspect
]

{ #category : #examples }
ClpFixedQualitativePaletteGenerator class >> example60AccentColors [
	
	self sample60AccentColors asCollection inspect
]

{ #category : #'instance creation' }
ClpFixedQualitativePaletteGenerator >> fromColors: aCollectionOfColors get: aNumberOfColors [

	"extract first colors aNumberOfColors from a predefined accent palette with 60 most distinguished colors"

	^ aCollectionOfColors copyFrom: 1 to: aNumberOfColors
]

{ #category : #initialization }
ClpFixedQualitativePaletteGenerator >> initialize [ 

	super initialize .
	numberOfColors := 15
]

{ #category : #accessing }
ClpFixedQualitativePaletteGenerator >> makeColors [
	
	self numberOfColors
	> self class example60AccentColorsPalette asCollection size ifTrue: [ 
		Error signal: 'Maximum number of colors to choose is 60' ].
	^ self
		  fromColors: self class example60AccentColorsPalette asCollection
		  get: self numberOfColors
]
