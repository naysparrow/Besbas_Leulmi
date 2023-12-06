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

	^ self neighbours class = MygBMPlayer 
		  ifTrue: [ MygBMBoxElement boxIconBreakable  ]
		  ifFalse: [ MygBMBoxElement boxIconBreakable  ]
]

{ #category : #accessing }
MygBMBreakBox >> isBox [ 

	^ true
]
