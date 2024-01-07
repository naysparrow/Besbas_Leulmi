Class {
	#name : #MygBMDoor,
	#superclass : #MygBMElement,
	#category : #'Myg-Bomberman-Model'
}

{ #category : #initialization }
MygBMDoor class >> textualMapCharacter [ 
^ $D
]

{ #category : #accessing }
MygBMDoor >> bringIn:  anActor going: aDirection [

anActor containKey ifTrue: [ ^super bringIn: anActor  going: aDirection   ]. 
]

{ #category : #accessing }
MygBMDoor >> initialize [ 
super initialize .
]

{ #category : #accessing }
MygBMDoor >> isDoor [ 

^true
]
