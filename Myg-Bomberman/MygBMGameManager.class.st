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

^'###       ##
#   #####
# $ $ $ #
### # # #
  # #   #
 ## T ### ##
 # @#
 # $ $   #
 # ### ###
 #     #
 #######'
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
MygBMGameManager >> launchFromString: aString [

	| board |
	self currentMoveCount: 0.
	self currentBoardElement: MygBMBoardElement new.
	board := MygBMBoard
		         createWithBoard: ((MygLevelImporter fromString: aString fromPackage:MygBMBoard package) do: [ :each | each configured ])
		         managedBy: self.
	self currentBoardElement openWithModel: board
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> menu [ 

	^ menu
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> menu: aToMenu [

	menu := aToMenu
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> notebook [ 
	
	^ notebook 
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> notebook: aNotebook [

	notebook := aNotebook 
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> packDictionary [ 
	
	^ packDictionary 
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> packDictionary: aDictionary [

	packDictionary := aDictionary
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> updateButton [

	| menuButton button elt |
	menuButton := self menu items detect: [ :each |
		              each label text asString
		              = self currentLevel keys first ].
	button := menuButton items at: self currentLevel values first.
	elt := BlElement new background:
		       (Smalltalk ui icons iconNamed: #glamorousAccept).
	elt size: elt background image extent.
	button icon: elt
]

{ #category : #'as yet unclassified' }
MygBMGameManager >> updateNotebookButton [

	| button elt page string icon |
	string := self currentLevel keys first withoutPrefix: 'mazes'.
	"replace with 'page := notebook pageTitled: string' when pageTitled: added to Toplo"
	page := notebook pages detect: [ :each |
		        each titleElement labelElement text asString = string ].
	elt := page bodyFactory value.
	button := elt childWithId: self currentLevel values first asString.
	icon := BlElement new background:
		        (Smalltalk ui icons iconNamed: #glamorousAccept).
	icon size: icon background image extent.
	button icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #glamorousAccept))
]
