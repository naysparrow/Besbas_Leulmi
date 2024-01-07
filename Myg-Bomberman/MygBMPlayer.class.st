Class {
	#name : #MygBMPlayer,
	#superclass : #MygBMMovable,
	#instVars : [
		'facing',
		'life'
	],
	#category : #'Myg-Bomberman-Model'
}

{ #category : #initialization }
MygBMPlayer class >> textualMapCharacter [ 
	^ $@
]

{ #category : #accessing }
MygBMPlayer >> accept: aVisitor [ 

aVisitor visitPlayer: self.
]

{ #category : #accessing }
MygBMPlayer >> backgroundRepresentation [

	| dict |
	dict := {
		        (CpNorthDirection -> MygSkBoxElement playerUpIcon).
		        (CpWestDirection -> MygSkBoxElement playerLeftIcon).
		        (CpSouthDirection -> MygSkBoxElement playerDownIcon).
		        (CpEastDirection -> MygSkBoxElement playerRightIcon) } asDictionary.
	^ dict at: self facing
]

{ #category : #accessing }
MygBMPlayer >> explose [ 

self looseOneLife.
]

{ #category : #accessing }
MygBMPlayer >> facing [ 

	^ facing
]

{ #category : #accessing }
MygBMPlayer >> facing: aCpDirection [
	
	facing := aCpDirection 
]

{ #category : #accessing }
MygBMPlayer >> getKey [ 

^key
]

{ #category : #accessing }
MygBMPlayer >> initialize [ 

	super initialize.
	facing := CpSouthDirection.
	life := 3.
	key:= false.
]

{ #category : #accessing }
MygBMPlayer >> isPlayer [ 
	^ true
]

{ #category : #accessing }
MygBMPlayer >> life [ 

^life 
]

{ #category : #accessing }
MygBMPlayer >> looseOneLife [ 
^ life := life -1.
]

{ #category : #accessing }
MygBMPlayer >> move: aCpDirection [

	self facing: aCpDirection class.
	^ super move: aCpDirection
]

{ #category : #accessing }
MygBMPlayer >> setBombe [ 

|bombeLocation bomb|

bombeLocation := self position.
bomb := MygBMBomb new.

self board atColumn: bombeLocation x atRow: bombeLocation y put: bomb.
bomb position: bombeLocation .

^bomb. 
]

{ #category : #accessing }
MygBMPlayer >> setKey: anObject [ 

anObject isKey ifTrue: (key := true).
]
