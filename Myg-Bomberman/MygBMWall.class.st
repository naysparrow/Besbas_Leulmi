Class {
	#name : #MygBMWall,
	#superclass : #MygBMElement,
	#category : #'Myg-Bomberman-Model'
}

{ #category : #initialization }
MygBMWall class >> textualMapCharacter [ 

	^ $#
]

{ #category : #accessing }
MygBMWall >> backgroundRepresentation [

	^ MygBMBoxElement wallIcon
]

{ #category : #accessing }
MygBMWall >> bringIn: anActor going: aDirection [
	"anActor does not move in a wall. Nothing enter a wall."
	
	^ false
]
