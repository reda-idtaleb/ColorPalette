Class {
	#name : #MiNavigationTreePalette,
	#superclass : #MiVisualizationPalette,
	#category : #'ColorPalette-Palette'
}

{ #category : #style }
MiNavigationTreePalette >> defaultStyle [ 

	 self
	  		addName: #backgroundReceivedEntity forColor: Color red;
			addName: #backgroundDependencyEntity forColor: (Color r: 0.68 g: 0.83 b: 0.97 alpha:1.0); "smalltalk color blue"
			addName: #inheritanceButtonsColor forColor: Color red;
			addName: #referenceButtonColor forColor: Color lightGray ;
			addName: #edgeColor forColor: Color lightGray ;
			addName: #labelColor forColor: Color black
			
]

{ #category : #initialization }
MiNavigationTreePalette >> initialize [ 

	super initialize 
]
