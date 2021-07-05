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
Color >> hclToRgb: hclColor [
	
	^ self labToRgb: (self hclToLab: hclColor )
		
			
]

{ #category : #'*ColorPalette' }
Color >> labToHcl: colorLab [

	"HCL(Hue-Chroma-Luminance) its a color space model
	 more information on: https://en.wikipedia.org/wiki/HCL_color_space"

	| h hcl |
	hcl := Dictionary new.
	h := ((colorLab at: #b) arcTan: (colorLab at: #a)) * (180 / Float pi).
	hcl
		at: #hue put: (h < 0
				 ifTrue: [ h + 360 ]
				 ifFalse: [ h ]);
		at: #chroma put: ((colorLab at: #a) * (colorLab at: #a) + ((colorLab at: #b) * (colorLab at: #b))) sqrt;
		at: #luminance put: (colorLab at: #luminance).
	^ hcl
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

{ #category : #'*ColorPalette' }
Color >> labToXyz: t [

	"t is a number"

	| t1 t2 |
	t1 := 6 / 29.
	t2 := 3 * t1 * t1.
	^ t > t1
		  ifTrue: [ t * t * t ]
		  ifFalse: [ t2 * (t - 4 / 29) ]
]

{ #category : #'*ColorPalette' }
Color >> lrgbToRgb: x [

	"x is a number"
	^ (255*(x <= 0.0031308
		   ifTrue: [ 12.92 * x ]
		   ifFalse: [ 1.055 * (x raisedTo: 1 / 2.4) - 0.055])) rounded | 0
]

{ #category : #'*ColorPalette' }
Color >> rgbToHcl [
	
	"rgbToHcl first uses converting from RGB to L*a*b* before converting to HCL"
	
	^ self labToHcl: (self rgbToLab)
		
			
]

{ #category : #'*ColorPalette' }
Color >> rgbToLab [
	
	"The CIELAB color space also referred to as L*a*b* is a color space defined by the International Commission on Illumination. More information on https://en.wikipedia.org/wiki/CIELAB_color_space
	 Return a dictionary representing the Lab color space
	 1st key: Luminance of the color(a value between [0, 100]). 
	 2nd key: the component 'a' which is a value between [-100, 100]
	 3rd key: the component 'b' which is a value between [-100, 100]	"
		
	| lab r g b y x z |
	lab := Dictionary new.
	r := self rgbToLrgb: self red.
	g := self rgbToLrgb: self green.
	b := self rgbToLrgb: self blue.
	y := self xyzToLab: ((0.2225045 * r) + (0.7168786 * g) + (0.0606169 * b)) / 1.
	x := ((r == g) and: (g == b)) 
		ifTrue: [ y ] 
		ifFalse: [ self xyzToLab: ((0.4360747 * r) + (0.3850649 * g) + (0.1430804 * b)) / 0.96422 ].
	z := ((r == g) and: (g == b)) 
		ifTrue: [ y ] 
		ifFalse: [ self xyzToLab: ((0.0139322 * r) + (0.0971045 * g) + (0.7141733 * b)) / 0.82521 ].
	
	lab 
		at: #luminance put: 116 * y - 16;
		at: #a put: 500 * (x - y);
		at: #b put: 200 * (y - z).
	^ lab	
			
]

{ #category : #'*ColorPalette' }
Color >> rgbToLrgb: x [

	"x is a number between 0 - 255"
	
	| x2 |
	x2 := x .
	^ x2 <=  0.04045 
			ifTrue: [ x2 / 12.92 ]
			ifFalse: [ ((x2+0.055)/1.055) raisedTo: 2.4 ]
	
]

{ #category : #'*ColorPalette' }
Color >> xyzToLab: t [

	| t1 t2 t3 |
	t1 := 6 / 29.
	t2 := 3 * t1 * t1.
	t3 := t1 * t1 * t1.
	^ t > t3
		  ifTrue: [ t raisedTo: 1 / 3 ]
		  ifFalse: [ t / t2 + 4 / 29 ]
]
