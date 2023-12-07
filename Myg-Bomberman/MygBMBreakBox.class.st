Class {
	#name : #MygBMBreakBox,
	#superclass : #MygBMBreakable,
	#category : #'Myg-Bomberman-Model'
}

{ #category : #initialization }
MygBMBreakBox class >> textualMapCharacter [ 
	
	^ $T
]

{ #category : #accessing }
MygBMBreakBox >> backgroundRepresentation [

	^ MygBMBoxElement boxIconBreakable 
]

{ #category : #accessing }
MygBMBreakBox >> bringIn: aPlayer going: aDirection [
"Override the bringIn method to handle breakable box logic."

	| boxPreviousPosition neighbor didMove bombNearby|
	aPlayer class = self class ifTrue: [ ^ false ].
	boxPreviousPosition := self position.
	"we store the current position because if I can move, I will have to move the player to my old position."
	neighbor := self board atPosition: aDirection * self position.
	"First I tried to move in by asking my neighbor"
	didMove := self moveIn: neighbor going: aDirection.
	"If I moved them moved the player to move into my previous position"
	didMove ifTrue: [
		| playerPreviousPosition |
		playerPreviousPosition := aPlayer position.
		aPlayer basicPosition: boxPreviousPosition.
		self board updatePositionOf: aPlayer from: playerPreviousPosition .
	(neighbor isBreakable and:[didMove])ifTrue: [ self board removeBox: neighbor.
		
		bombNearby := (self board boxes detect:[ :each | (each isKindOf: MygBMBomb) and: [ each position isAdjacentTo: self position]]) ifNotNil: [ :bomb|bomb explode.true].
		].
	].
	^ didMove
]

{ #category : #accessing }
MygBMBreakBox >> isAdjacentTo: aPosition [

^ (self position isAdjacentTo: aPosition position)
]

{ #category : #accessing }
MygBMBreakBox >> isBox [ 

	^ true
]

{ #category : #accessing }
MygBMBreakBox >> isBreakable [  
"Indicate that this box is breakable."
	^ true
]
