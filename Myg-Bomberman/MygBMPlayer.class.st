Class {
	#name : #MygBMPlayer,
	#superclass : #MygBMMovable,
	#instVars : [
		'facing'
	],
	#category : #'Myg-Bomberman-Model'
}

{ #category : #initialization }
MygBMPlayer class >> textualMapCharacter [ 
	^ $@
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
MygBMPlayer >> facing [ 

	^ facing
]

{ #category : #accessing }
MygBMPlayer >> facing: aCpDirection [
	
	facing := aCpDirection 
]

{ #category : #accessing }
MygBMPlayer >> initialize [ 

	super initialize.
	facing := CpSouthDirection
]

{ #category : #accessing }
MygBMPlayer >> isPlayer [ 
	^ true
]

{ #category : #accessing }
MygBMPlayer >> move: aCpDirection [

	self facing: aCpDirection class.
	^ super move: aCpDirection
]

{ #category : #accessing }
MygBMPlayer >> placeBomb [ 

 |position1 bomb|

position1 := self position.
bomb := MygBMBomb new.
bomb basicPosition: position1.
self board addBox: bomb.
bomb explode.
]
