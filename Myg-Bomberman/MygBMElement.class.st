Class {
	#name : #MygBMElement,
	#superclass : #MygAbstractBox,
	#category : #'Myg-Bomberman-Model'
}

{ #category : #initialization }
MygBMElement class >> configured [ 

	^ self new configured
]

{ #category : #initialization }
MygBMElement class >> textualMapCharacter [
	^ $Z
]

{ #category : #accessing }
MygBMElement >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	
	position := aPosition
]

{ #category : #accessing }
MygBMElement >> bringIn: aSkMovable going: aDirection [
	"By default when a movable wants to move in, we move it in. By default do not use the direction, it is only usd for case where we need to check the next element in that direction, e.g., Player push a Box and the box should check if there is a ground or a wall before moving in that direction."

	| previousPosition |
	previousPosition := aSkMovable position.
	aSkMovable basicPosition: self position.
	self board gameManager ifNotNil: [
		self board gameManager currentMoveCount:
			self board gameManager currentMoveCount + 1 ].
	self board updatePositionOf: aSkMovable from: previousPosition.
	^ true
]

{ #category : #accessing }
MygBMElement >> configureBoard: aBoard [

	self board: aBoard.
	
]

{ #category : #accessing }
MygBMElement >> configured [ 

	^self
]

{ #category : #accessing }
MygBMElement >> isBreakable [ 

	^ false
]

{ #category : #accessing }
MygBMElement >> isPlayer [
	^ false
]

{ #category : #accessing }
MygBMElement >> isTarget [
	^ false
]

{ #category : #accessing }
MygBMElement >> moveIn: aNeighbor going: aDirection [
	"To move in a position, we ask the entity where we want to get in to decide.
	This is not a double dispatch per se because we do not have to discrimnate on the receiver."
	
	^ aNeighbor bringIn: self going: aDirection
]

{ #category : #accessing }
MygBMElement >> postCreationAction [

	self
]

{ #category : #accessing }
MygBMElement >> printOn: aStream [ 

	super printOn: aStream.
	aStream nextPut: $-.
	position printOn: aStream
]
