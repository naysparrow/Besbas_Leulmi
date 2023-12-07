Object subclass: #MygBMKeyHandler
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'Myg-Bomberman-UI'

MygBMKeyHandler >> initialize
    "Initializes the key handler"
    super initialize.
    World primaryHand addKeyboardFocus: self.

MygBMKeyHandler >> handleKeystroke: aKeystroke
    "Handles the keystroke event"
    | direction |
    
    "Map the keystroke to a movement direction or action"
    direction := self mapKeystrokeToDirection: aKeystroke.
    
    "Handle the direction/action accordingly"
    self handleDirection: direction.

MygBMKeyHandler >> mapKeystrokeToDirection: aKeystroke
    "Maps a keystroke to a movement direction or action"
    | directionMap |
    
    "Define a mapping of keystrokes to directions or actions"
    directionMap := {
        ($w -> #north).
        ($a -> #west).
        ($s -> #south).
        ($d -> #east).
        ($b -> #placeBomb).
        ($q -> #quitGame).
        
    }.
    
    "Lookup the direction or action for the given keystroke"
    ^ directionMap at: aKeystroke ifAbsent: [#unknown].

MygBMKeyHandler >> handleDirection: aDirection
    "Handles the given direction or action"
    
    "Dispatch to specific methods based on the direction or action"
    aDirection = #north ifTrue: [ self handleMove: CpDirection north ].
    aDirection = #west ifTrue: [ self handleMove: CpDirection west ].
    aDirection = #south ifTrue: [ self handleMove: CpDirection south ].
    aDirection = #east ifTrue: [ self handleMove: CpDirection east ].
    aDirection = #placeBomb ifTrue: [ self handlePlaceBomb ].
    aDirection = #quitGame ifTrue: [ self handleQuitGame ].
    

MygBMKeyHandler >> handleMove: aDirection
    "Handles the movement in the specified direction"
    

MygBMKeyHandler >> handlePlaceBomb
    "Handles the action of placing a bomb"
   

MygBMKeyHandler >> handleQuitGame
    "Handles the action of quitting the game"
    
