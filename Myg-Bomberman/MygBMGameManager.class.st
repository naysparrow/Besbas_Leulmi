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
	tmp := MygLevelImporter fromString: aString fromPackage: MygBMBoard package.
	tmp := tmp collect: [ :each | each configured ].
	tmp width < tmp height ifTrue: [ tmp := tmp rotateLeft ].
	^ tmp
]

{ #category : #'as yet unclassified' }
MygBMGameManager class >> levelDisign [

^' #######
 #  *  #
 #  @  #
 ##$#.##
 #  #  #
 # $#. #
 #  #  #
## ## ##
#  * * #
#   *  #
###   ##
  #####'
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
MygBMGameManager >> currentLevel [ 
	
	^ currentLevel 
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> currentLevel: aDictionary [

	currentLevel := aDictionary 
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> currentLevelString [

	^ currentLevelString
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> currentLevelString: aString [

	currentLevelString := aString
	
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
MygBMGameManager >> initialize [

	super initialize.
	currentMoveCount := 0.
	
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> launchAgain [

	self launchFromString: self levelDisgn .
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> launchFromString: aString [

	| board |
	self currentMoveCount: 0.
	self currentBoardElement: MygBMBoardElement new.
	board := MygBMBoard
		         createWithBoard: ((MygLevelImporter fromString: '   ###   @  ' fromPackage:MygBMBoard package) do: [ :each | each configured ])
		         managedBy: self.
	self currentBoardElement openWithModel: board
]
