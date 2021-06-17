Class {
	#name : #BaselineOfColorPalette,
	#superclass : #Object,
	#category : #BaselineOfColorPalette
}

{ #category : #baselines }
BaselineOfColorPalette >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: 'ColorPalette';
			package: 'ColorPalette-Tests'
			with: [ spec requires: 'ColorPalette' ]
			].
	spec
		group: 'default'
		with: #( 'ColorPalette' 'ColorPalette-Tests' )
]
