Class {
	#name : #MygBMBoard,
	#superclass : #Object,
	#instVars : [
		'player',
		'boxes',
		'ended',
		'gameManager'
	],
	#category : #'Myg-Bomberman-Model'
}

{ #category : #'test ressources' }
MygBMBoard class >> matrixForField [

	^ self createWithMatrix: ((CTNewArray2D
			    width: 5
			    height: 5))
]
