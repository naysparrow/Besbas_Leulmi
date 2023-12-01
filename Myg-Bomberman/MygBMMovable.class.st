Class {
	#name : #MygBMMovable,
	#superclass : #MygBMElement,
	#instVars : [
		'background'
	],
	#category : #'Myg-Bomberman-Model'
}

{ #category : #accessing }
MygBMMovable >> background [

	^ background
]

{ #category : #accessing }
MygBMMovable >> background: anObject [

	background := anObject
]

{ #category : #accessing }
MygBMMovable >> board: aBoard [ 

	super board: aBoard.
	self background board: aBoard
]

{ #category : #accessing }
MygBMMovable >> configured [

	self background: self defaultBackground.
	^ self
]

{ #category : #accessing }
MygBMMovable >> defaultBackground [

	^ MygBMGround new
]

{ #category : #accessing }
MygBMMovable >> move: aCpDirection [

	| newPosition neighbor |
	newPosition := aCpDirection * self position.
	neighbor := self board atPosition: newPosition.
	^ self moveIn: neighbor going: aCpDirection
]

{ #category : #accessing }
MygBMMovable >> moveEast [

	^ self move: CpDirection east
]

{ #category : #accessing }
MygBMMovable >> moveNorth [

	^ self move: CpDirection north
]

{ #category : #accessing }
MygBMMovable >> moveSouth [

	^ self move: CpDirection south
]

{ #category : #accessing }
MygBMMovable >> moveWest [

	^ self move: CpDirection west
]

{ #category : #accessing }
MygBMMovable >> position: aPoint [

	position := aPoint.
	self background position: aPoint
]
