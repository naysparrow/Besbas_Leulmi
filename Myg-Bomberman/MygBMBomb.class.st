Class {
	#name : #MygBMBomb,
	#superclass : #MygBMElement,
	#category : #'Myg-Bomberman-Model'
}

{ #category : #initialization }
MygBMBomb class >> textualMapCharacter [ 

	^ $B
]

{ #category : #accessing }
MygBMBomb >> backgroundRepresentation [

	^ MygBMBoxElement bombIcon
]
