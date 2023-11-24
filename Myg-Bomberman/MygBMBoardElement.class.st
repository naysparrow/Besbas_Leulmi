Class {
	#name : #MygBMBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'backgroundLayer',
		'foregroundLayer',
		'directionDict'
	],
	#category : #'Myg-Bomberman-UI'
}

{ #category : #'instance creation' }
MygBMBoardElement >> backgroundLayer [ 

	^ backgroundLayer
]

{ #category : #'instance creation' }
MygBMBoardElement >> backgroundLayer: aBlElement [

	backgroundLayer := aBlElement 
]

{ #category : #'instance creation' }
MygBMBoardElement >> board [ 
	^ board
]

{ #category : #'instance creation' }
MygBMBoardElement >> board: aSkBoard [

	board := aSkBoard.
	self constraintsDo: [ :c |
		c frame vertical alignCenter.
		c horizontal matchParent.
		c vertical fitContent ].
	self
		initializeBackgroundLayer;
		initializeForegroundLayer
]

{ #category : #'instance creation' }
MygBMBoardElement >> initializeBackgroundLayer [

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: board width;
				          cellSpacing: 2);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox container |
		tmpBox := aBox.
		(aBox class inheritsFrom: MygSkMovable) ifTrue: [
			tmpBox := aBox background ].
		boxElement := (MygSkBoxElement box: tmpBox)
			              positionInField: aBox position;
			              board: board.
		container := BlElement new
			             layout: BlSquaredLayout new;
			             constraintsDo: [ :c |
				             c frame vertical alignCenter.
				             c horizontal matchParent.
				             c vertical fitContent ];
			             addChild: boxElement;
			clipChildren: false.
		layer addChild: container.
		boxElement updateBackgroundColor ].

	self backgroundLayer: layer
]

{ #category : #'instance creation' }
MygBMBoardElement >> openWithModel: aSkBoard [

	| space |
	space := BlSpace new.
	space
		extent: 500 asPoint;
		resizable: false.
	space root addChild: self.

	self board: aSkBoard.

	space root background: Color red muchLighter.
	space root layout: BlFrameLayout new.
	space show
]
