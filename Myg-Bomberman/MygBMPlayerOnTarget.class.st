Class {
	#name : #MygBMPlayerOnTarget,
	#superclass : #MygBMPlayer,
	#category : #'Myg-Bomberman-Model'
}

{ #category : #initialization }
MygBMPlayerOnTarget class >> textualMapCharacter [
	^ $+
]

{ #category : #accessing }
MygBMPlayerOnTarget >> configured [

	^ MygBMPlayer new background: self defaultBackground
]

{ #category : #accessing }
MygBMPlayerOnTarget >> defaultBackground [

	^ MygBMTarget
		  new
]
