Class {
	#name : #MygBMBox,
	#superclass : #MygBMMovable,
	#category : #'Myg-Bomberman-Model'
}

{ #category : #'default encoding' }
MygBMBox class >> textualMapCharacter [ 
	
	^ $$
]

{ #category : #accessing }
MygBMBox >> backgroundRepresentation [

	^ self background class = MygSkTarget
		  ifTrue: [ MygBMBoxElement boxIconDarker ]
		  ifFalse: [ MygBMBoxElement boxIcon ]
]

{ #category : #accessing }
MygBMBox >> bringIn: aPlayer going: aDirection [

	| boxPreviousPosition neighbor didMove |
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
		self board updatePositionOf: aPlayer from: playerPreviousPosition ].
	^ didMove
]

{ #category : #accessing }
MygBMBox >> isBox [ 

	^ true
]

{ #category : #accessing }
MygBMBox >> setKey [ 

key := true.
	self board setPositionKey: self .
	^true.
]
