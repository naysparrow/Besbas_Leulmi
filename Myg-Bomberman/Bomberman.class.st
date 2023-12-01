Class {
	#name : #Bomberman,
	#superclass : #Object,
	#category : #'Myg-Bomberman-Toplo'
}

{ #category : #'private - menu building' }
Bomberman class >> buttonStart [ 

|button level |
level := MygBMGameManager levelDisign.
button := ToButton new.
button 
      background: Color veryVeryLightGray;
		border: (BlBorder paint: Color veryDarkGray).
button labelText: 'Play'.
button size: 100@50;

whenClickedDo:[MygBMGameManager new launchFromString:  level  ].

button icon: 
		(ToImage inner: (Smalltalk ui icons iconNamed: #glamorousLeftSide  )).

^button


]

{ #category : #'as yet unclassified' }
Bomberman class >> menuBar [

	| bar |
	bar := ToMenuBar new
		       hMatchParent;
		       vFitContent.
	bar
		background: Color veryVeryLightGray;
		border: (BlBorder paint: Color veryDarkGray).
	^ bar
]

{ #category : #'as yet unclassified' }
Bomberman class >> menuHelp [

	| menu |
	menu := ToMenu new.
	menu label: (ToLabel text: 'Help').
	menu icon:
		(ToImage inner: (Smalltalk ui icons iconNamed: #glamorousHelp)).
	menu whenClickedDo: [
		| container lab space |
		lab := ToLabel text: 'Bomberman est un jeu vidéo de puzzle dans lequel le joueur incarne un personnage qui place des bombes dans un labyrinthe, essayant de détruire les obstacles et d éliminer les ennemis. Le jeu a été conçu en 1983 par Shigeki Fujiwara et a été publié pour la première fois en décembre 1983.

Le jeu se déroule sur un tableau de cases, où chaque case est soit un sol, soit un mur. Certains sols contiennent des bombes, et d autres sont des emplacements marqués pour les bonus ou les améliorations.

Le joueur est confiné dans le labyrinthe et peut se déplacer horizontalement ou verticalement sur des cases vides (sans traverser les murs ou les bombes). Le joueur peut poser une bombe en se déplaçant vers une case vide et la faire exploser après un certain délai. Les bombes peuvent détruire les murs et éliminer les ennemis, mais le joueur doit faire attention à ne pas être pris dans l explosion.

Les ennemis se déplacent de manière autonome dans le labyrinthe, suivant des schémas de déplacement spécifiques. Le joueur doit utiliser des stratégies intelligentes pour éviter les ennemis tout en posant des bombes stratégiquement pour maximiser les dégâts aux obstacles et aux adversaires.

Le jeu propose également des bonus et des améliorations que le joueur peut collecter pour augmenter sa puissance de bombe, sa vitesse de déplacement, etc.

Les commandes du jeu :

    Flèches directionnelles : se déplacer dans le labyrinthe
    Espace : réinitialiser le niveau ou le rejouer une fois terminé
    Échap : quitter le niveau actuel

Vous pouvez commencer à jouer en sélectionnant le menu ''Niveaux'' et en choisissant le niveau que vous souhaitez explorer.

Amusez-vous bien !' asRopedText.
		lab beMultiLine.
		lab hMatchParent.
		container := BlElement new
			             background: Color lightRed;
			             padding: (BlInsets all: 15);
			             layout: BlLinearLayout vertical;
			             constraintsDo: [ :c |
				             c horizontal fitContent.
				             c vertical fitContent ].
		container addChild: lab.
		space := BlSpace new.
		space root
			layout: BlFrameLayout new;
			addChild: container;
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical fitContent ].
		space pulse.
		space extent: container extent.
		space show ].
	^ menu
]

{ #category : #'private - menu building' }
Bomberman class >> open [
	<script>

	| space container helpMenu bar title button |
	helpMenu := self menuHelp.
	bar := self menuBar.
	title := self title.
	button := self buttonStart.
	container := BlElement new
		             background: Color purple;
		             layout: BlLinearLayout vertical;
		             constraintsDo: [ :c |
			             c horizontal matchParent.
			             c vertical matchParent ].
	container addChildren: {
			bar.
			title.
			button }.

	bar addMenu: helpMenu.
	space := BlSpace new.

	space root addChild: container .
	space extent: 1000 @ 1000.
	space show
]

{ #category : #'private - menu building' }
Bomberman class >> title [

	| title |
	title := BlElement new.
	title size: 50 @ 200.
	title constraintsDo: [ :c | c horizontal matchParent ].
	title layout: BlFrameLayout new.
	title addChild: ((BlTextElement new text: ('Bomberman' asRopedText
				   fontName: 'Phosphate';
				   foreground: Color white;
				   fontSize: 100)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	^ title
]
