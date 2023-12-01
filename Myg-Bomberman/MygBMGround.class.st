Class {
	#name : #MygBMGround,
	#superclass : #MygBMElement,
	#category : #'Myg-Bomberman-Model'
}

{ #category : #initialization }
MygBMGround class >> textualMapCharacter [
	^ Character space
]

{ #category : #accessing }
MygBMGround >> backgroundRepresentation [

	^ Color transparent
]
