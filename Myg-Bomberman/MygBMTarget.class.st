Class {
	#name : #MygBMTarget,
	#superclass : #MygBMElement,
	#category : #'Myg-Bomberman-Model'
}

{ #category : #initialization }
MygBMTarget class >> textualMapCharacter [ 

	^ $.
]

{ #category : #accessing }
MygBMTarget >> backgroundRepresentation [

	^ MygBMBoxElement  targetIcon
]

{ #category : #accessing }
MygBMTarget >> isTarget [ 
	^ true
]
