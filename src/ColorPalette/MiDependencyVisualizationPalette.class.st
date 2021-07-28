Class {
	#name : #MiDependencyVisualizationPalette,
	#superclass : #MiVisualizationPalette,
	#category : #'ColorPalette-Palette'
}

{ #category : #style }
MiDependencyVisualizationPalette >> defaultStyle [

	 self
		  addName: #linksColor forColor: Color black;
		  addName: #incomingEdgeColor forColor: Color green;
		  addName: #outgoingEdgeColor forColor: Color blue;
		  addName: #incomingOutgoingEdgeColor forColor: Color red;
		  addName: #numberOfLinesBeginScale forColor: Color white;  "this is for background boxes"
		  addName: #numberOfLinesEndScale forColor: Color darkGray; "this is for background boxes"
		  addName: #highlightEntity forColor: Color yellow darker "when we hover an entity"
]

{ #category : #initialization }
MiDependencyVisualizationPalette >> initialize [ 

	super initialize 
]
