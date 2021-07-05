Extension { #name : #Color }

{ #category : #'*ColorPalette' }
Color >> hclToLab: hclColor [

	| h lab |
	lab := Dictionary new.
	h := (hclColor at: #hue) * (Float pi / 180).
	lab 
		at: #luminance put: (hclColor at: #luminance);
		at: #a put: h cos * (hclColor at: #chroma);
		at: #b put: h sin * (hclColor at: #chroma).
	^ lab 

]

{ #category : #'*ColorPalette' }
Color >> labToRgb: labColor [

	"labColor is a dictionary representing the L*a*b* color format"

	| baseY x y z r g b |
	baseY := (labColor at: #luminance) + 16 / 116.
	x := 0.96422 * (self labToXyz: baseY + ((labColor at: #a) / 500)).
	y := self labToXyz: baseY.
	z := 0.82521 * (self labToXyz: baseY - ((labColor at: #b) / 200)).

	r := (self lrgbToRgb:3.1338561 * x - (1.6168667 * y) - (0.4906146 * z)) max: 0.
	g := (self lrgbToRgb:-0.9787684 * x + (1.9161415 * y) + (0.0334540 * z)) max:0.
	b := (self lrgbToRgb:0.0719453 * x - (0.2289914 * y) + (1.4052427 * z)) max:0.
	^ self class r: r / 255 g: g / 255 b: b / 255
]
