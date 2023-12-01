Class {
	#name : #MygBMGameManager,
	#superclass : #Object,
	#instVars : [
		'menu',
		'notebook',
		'currentLevelString',
		'currentBoardElement',
		'currentMoveCount',
		'currentLevel',
		'packDictionary'
	],
	#category : #'Myg-Bomberman-Model'
}

{ #category : #'as yet unclassified' }
MygBMGameManager class >> importFromString: aString [

	| tmp |
	tmp := MygLevelImporter fromString: aString fromPackage: MygSkBoard package.
	tmp := tmp collect: [ :each | each configured ].
	tmp width < tmp height ifTrue: [ tmp := tmp rotateLeft ].
	^ tmp
]

{ #category : #'as yet unclassified' }
MygBMGameManager class >> levelDisign [

^' 
#########
#@     @#
#       #
#       #
#       #
#       #
#       #
#       #
#       #
#       #
#########
        '
yourself 
]

{ #category : #'as yet unclassified' }
MygBMGameManager class >> mazesLoma [
	"hsasquatch/sokoban/loma.html"

	^ IdentityDictionary new
		  at: 1 put: '  
#########
#@     @#
#       #
#       #
#       #
#       #
#       #
#       #
#       #
#       #
#########
        '; 
yourself
]

{ #category : #accessing }
MygBMGameManager class >> menu: aToMenu [

	^ self new menu: aToMenu 
]

{ #category : #accessing }
MygBMGameManager class >> notebook: aNotebook [

	^ self new notebook: aNotebook 
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> currentBoardElement [

	^ currentBoardElement 
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> currentBoardElement: aBMBoardElement [

	currentBoardElement:= aBMBoardElement 
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> currentMoveCount [ 
	
	^ currentMoveCount 
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> currentMoveCount: aNumber [

	currentMoveCount:= aNumber 
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> launchFromString: aString [

	| board |
	self currentMoveCount: 0.
	self currentBoardElement: MygSkBoardElement  new.
	board := MygSkBoard
		         createWithBoard: (self class importFromString: aString)
		         managedBy: self.
	self currentBoardElement openWithModel: board
]
