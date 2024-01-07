Class {
	#name : #MygBMBomb,
	#superclass : #MygBMElement,
	#category : #'Myg-Bomberman-Model'
}

{ #category : #initialization }
MygBMBomb class >> textualMapCharacter [ 

^ $O
]

{ #category : #'as yet unclassified' }
MygBMBomb >> accept: aVisitor [ 

aVisitor visitBomb: self.
]

{ #category : #'as yet unclassified' }
MygBMBomb >> explose [ 
|previousPosition|

previousPosition := self position.
self board atColumn: previousPosition x atRow: previousPosition y put: MygBMGround new.  
]

{ #category : #'as yet unclassified' }
MygBMBomb >> explose: anElement [

anElement explose.
self explose.
]

{ #category : #'as yet unclassified' }
MygBMBomb >> exploseNeighbors [ 

|positionBombe|

positionBombe := self position.

self explose: (self board atColumn: positionBombe x+1 atRow: positionBombe y ).
self explose: (self board atColumn: positionBombe x-1 atRow: positionBombe y ).
self explose: (self board atColumn: positionBombe x atRow: positionBombe y-1 ).
self explose: (self board atColumn: positionBombe x atRow: positionBombe y+1 ).
]
