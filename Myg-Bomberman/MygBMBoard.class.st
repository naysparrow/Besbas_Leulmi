Class {
	#name : #MygBMBoard,
	#superclass : #MygBoard,
	#instVars : [
		'player',
		'boxes',
		'ended',
		'gameManager'
	],
	#category : #'Myg-Bomberman-Model'
}

{ #category : #initialization }
MygBMBoard class >> createWithBoard: aCTNewArray2D [

	^ self new
		  configureGrid: aCTNewArray2D;
		  yourself
]

{ #category : #initialization }
MygBMBoard class >> createWithBoard: aCTNewArray2D managedBy: aSkGameManager [

	^ (self createWithBoard: aCTNewArray2D)
		  gameManager: aSkGameManager;
		  yourself
]

{ #category : #initialization }
MygBMBoard class >> importFromString: aString [
	|tmp|
	tmp := MygLevelImporter fromString: aString fromPackage: self package.
	tmp width < tmp height ifTrue: [ tmp := tmp rotateLeft ].
	^ tmp
]

{ #category : #initialization }
MygBMBoard class >> mazesLoma [
	"hsasquatch/sokoban/loma.html"

	^ IdentityDictionary new
		at: 1 put: '  ##### 
 ##   ## 
### #  # 
###$.# # 
#  $.#@# 
# #$.# # 
# #    # 
#  # ### 
##   ## 
 ##### ';
		yourself
]

{ #category : #adding }
MygBMBoard >> addBox: aBox [

	boxes add: aBox
]

{ #category : #adding }
MygBMBoard >> asciiString [ 

	^ String streamContents: [ :st |
		self printOn: st ]	
]

{ #category : #adding }
MygBMBoard >> at: anInteger at: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : #adding }
MygBMBoard >> at: anInteger at: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #adding }
MygBMBoard >> atColumn: anInteger atRow: anInteger2 [

	^ grid at: anInteger @ anInteger2
]

{ #category : #adding }
MygBMBoard >> atColumn: anInteger atRow: anInteger2 put: anElement [

	grid at: anInteger @ anInteger2 put: anElement
]

{ #category : #adding }
MygBMBoard >> atPosition: aCpPositionable [ 
	^ (grid at: aCpPositionable x @ aCpPositionable y)
]

{ #category : #adding }
MygBMBoard >> configureGrid: aCTNewArray2D [

	super configureGrid: aCTNewArray2D.
	self
		setBoxes;
		setPlayer

]

{ #category : #adding }
MygBMBoard >> do: aBlock [

	grid do: aBlock
]

{ #category : #adding }
MygBMBoard >> endGame [

	ended ifTrue: [ ^ self ].
	ended := true.
	gameManager ifNotNil: [ gameManager registerLevel ]
]

{ #category : #adding }
MygBMBoard >> ended [ 

	^ ended 
]

{ #category : #adding }
MygBMBoard >> gameManager [ 
	
	^ gameManager 
]

{ #category : #adding }
MygBMBoard >> gameManager: aSkGameManager [

	gameManager:= aSkGameManager 

]

{ #category : #adding }
MygBMBoard >> height [
	^ grid height
]

{ #category : #adding }
MygBMBoard >> initialize [

	super initialize.
	ended := false.
	boxes := OrderedCollection new

]

{ #category : #adding }
MygBMBoard >> isFinished [
	^ boxes allSatisfy: [ :each | each background isTarget ]
]

{ #category : #adding }
MygBMBoard >> moveSteps: aCollectionOfDirection [

	aCollectionOfDirection do: [ :each | player move: each ]
]

{ #category : #adding }
MygBMBoard >> player [
	^ player
]

{ #category : #adding }
MygBMBoard >> printOn: aStream [

	(1 to: grid height)
		do: [ :rowNumber |
			1 to: grid width do: [ :columnNumber |
				| el elClass |
				el := self atColumn: columnNumber atRow: rowNumber .
				elClass := (el class inheritsFrom: MygBMMovable)
					           ifFalse: [ el class ]
					           ifTrue: [
						           el background class = MygBMGround
							           ifTrue: [ el class ]
							           ifFalse: [ (el class asString , 'OnTarget') asClass ] ].
				aStream nextPut: elClass textualMapCharacter ] ]
		separatedBy: [ aStream cr ]
]

{ #category : #adding }
MygBMBoard >> reset [

	self gameManager launchAgain
]

{ #category : #adding }
MygBMBoard >> setBoxes [

	grid do: [ :each |
		each class = MygBMBox ifTrue: [ self addBox: each ] ].
]

{ #category : #adding }
MygBMBoard >> setPlayer [

	player := grid contents detect: #isPlayer
]

{ #category : #adding }
MygBMBoard >> updatePositionOf: aSkMovable from: previousPosition [
	"Put back the previous position element."

	self
		atColumn: previousPosition x
		atRow: previousPosition y
		put: aSkMovable background.
	"put the current position element as previous background of the moving element."
	aSkMovable background:
		(self atColumn: aSkMovable position x atRow: aSkMovable position y).
	"finally place the moving element to its new location"
	self
		atColumn: aSkMovable position x
		atRow: aSkMovable position y
		put: aSkMovable.
	self isFinished ifTrue: [ self endGame ]
]

{ #category : #adding }
MygBMBoard >> width [
	^ grid width
]
