Class {
	#name : #MygBMBreakable,
	#superclass : #MygBMElement,
	#instVars : [
		'background',
		'destroyed',
		'neigbours'
	],
	#category : #'Myg-Bomberman-Model'
}

{ #category : #accessing }
MygBMBreakable >> background [

	^ background
]

{ #category : #accessing }
MygBMBreakable >> background: anObject [

	background := anObject
]

{ #category : #accessing }
MygBMBreakable >> board: aBoard [ 

	super board: aBoard.
	self background board: aBoard
]

{ #category : #accessing }
MygBMBreakable >> configured [

	self background: self defaultBackground.
	^ self
]

{ #category : #accessing }
MygBMBreakable >> defaultBackground [

	^ MygBMGround new
]

{ #category : #accessing }
MygBMBreakable >> destroy [ 

self destroyed: true.
]

{ #category : #accessing }
MygBMBreakable >> destroyed [

^destroyed 
]

{ #category : #accessing }
MygBMBreakable >> destroyed: anBool [

	destroyed := anBool 
]

{ #category : #accessing }
MygBMBreakable >> neighbours [

^neigbours 
]

{ #category : #accessing }
MygBMBreakable >> neighbours: anObject [
 
 neigbours := anObject 
]

{ #category : #accessing }
MygBMBreakable >> position: aPoint [

	position := aPoint.
	self background position: aPoint
]
