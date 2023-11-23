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

{ #category : #'as yet unclassified' }
MygBMBoardElement class >> openBoardTest [

	^ self openWithModel: MygSkBoard boardTest
]

{ #category : #'as yet unclassified' }
MygBMBoardElement class >> openWithModel: aSkBoard [

	self new openWithModel: aSkBoard.
]

{ #category : #accessing }
MygBMBoardElement >> backgroundLayer [ 

	^ backgroundLayer
]

{ #category : #accessing }
MygBMBoardElement >> backgroundLayer: aBlElement [

	backgroundLayer := aBlElement 
]

{ #category : #accessing }
MygBMBoardElement >> board [ 
	^ board
]

{ #category : #accessing }
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

{ #category : #accessing }
MygBMBoardElement >> boardPreview: aSkBoard [

	board := aSkBoard.
	self loseFocus.
	self constraintsDo: [ :c |
		c frame vertical alignCenter.
		c horizontal matchParent.
		c vertical fitContent ].
	self
		initializeBackgroundLayerPreview;
		initializeForegroundLayerPreview.
	board := nil
]

{ #category : #accessing }
MygBMBoardElement >> directionDict [

	^ directionDict
]

{ #category : #accessing }
MygBMBoardElement >> elementsToUpdateAtPosition: aPoint goingIn: aCpDirection [

	| layer elements playerElement neighborElement nextNeighborElement |
	layer := self foregroundLayer.
	playerElement := (layer childWithId: aPoint asString) firstChild.
	neighborElement := (layer childWithId:
		                    (aCpDirection * aPoint) asString) firstChild.
	elements := {
		            playerElement.
		            neighborElement } asOrderedCollection.
	(neighborElement board grid at: neighborElement positionInField)
		class = MygSkWall ifFalse: [
		nextNeighborElement := (layer childWithId:
			                        (aCpDirection * (aCpDirection * aPoint))
				                        asString) firstChild.
		elements add: nextNeighborElement ].
	^ elements
]

{ #category : #accessing }
MygBMBoardElement >> foregroundLayer [

	^ foregroundLayer
]

{ #category : #accessing }
MygBMBoardElement >> foregroundLayer: aBlElement [

	foregroundLayer := aBlElement 
]

{ #category : #accessing }
MygBMBoardElement >> initialize [

	super initialize.
	self initializeDirectionDict.
	self
		background: (BlBackground paint: Color veryLightGray);
		layout: BlFrameLayout new;
		addEventHandlerOn: BlKeyDownEvent
		do: [ :anEvent | self manageEvent: anEvent ];
		requestFocus
]

{ #category : #accessing }
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

{ #category : #accessing }
MygBMBoardElement >> initializeBackgroundLayerPreview [

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: board width);
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

{ #category : #accessing }
MygBMBoardElement >> initializeDirectionDict [

	directionDict := {
		        (#DOWN -> CpDirection south).
		        (#UP -> CpDirection north).
		        (#LEFT -> CpDirection west).
		        (#RIGHT -> CpDirection east) } asDictionary.
]

{ #category : #accessing }
MygBMBoardElement >> initializeForegroundLayer [

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
		(aBox class inheritsFrom: MygSkMovable) ifFalse: [
			tmpBox := MygSkGround new ].
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

		layer addChild: container as: aBox position asString.
		boxElement updateBackgroundColor ].

	self foregroundLayer: layer
]

{ #category : #accessing }
MygBMBoardElement >> initializeForegroundLayerPreview [

	| layer |
	layer := BlElement new
		         background: Color transparent;
		         layout: (BlGridLayout horizontal
				          columnCount: board width);
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical fitContent ].
	self addChild: layer.
	self board do: [ :aBox |
		| boxElement tmpBox container |
		tmpBox := aBox.
		(aBox class inheritsFrom: MygSkMovable) ifFalse: [
			tmpBox := MygSkGround new ].
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

		layer addChild: container as: aBox position asString.
		boxElement updateBackgroundColor ].

	self foregroundLayer: layer
]

{ #category : #accessing }
MygBMBoardElement >> manageEvent: anEvent [

	| player moved direction neighborElement elements |
	anEvent key name = #SPACE ifTrue: [
		^ self resetBoard ].
	anEvent key name = #ESCAPE ifTrue: [
		^ self space close ].
	board isFinished ifTrue: [ ^ self ].
	player := self board player.
	direction := self directionDict
		             at: anEvent key name
		             ifAbsent: [ ^ self ].
	elements := self
		            elementsToUpdateAtPosition: player position
		            goingIn: direction.
	moved := player move: direction.

	neighborElement := elements second.

	(moved and: [ neighborElement box class = MygSkBox ])
		ifTrue: [
			| animation |
			animation := neighborElement boxAnimationMovingInDirection:
				             direction.
			neighborElement addAnimation: (animation onFinishedDo: [
					 neighborElement resetAnimation.
					 self updateElements: elements ]) ]
		ifFalse: [ self updateElements: elements ]
]

{ #category : #accessing }
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

{ #category : #accessing }
MygBMBoardElement >> resetBoard [

	self space close.
	self board reset
]

{ #category : #accessing }
MygBMBoardElement >> updateElements: anOrderedCollection [

	anOrderedCollection do: [ :each | each boxForForeground updateBackgroundColor ]
]
