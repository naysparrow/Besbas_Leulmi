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
