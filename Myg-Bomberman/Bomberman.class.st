Class {
	#name : #Bomberman,
	#superclass : #Object,
	#category : #'Myg-Bomberman-Toplo'
}

{ #category : #'private - menu building' }
Bomberman class >> open [
	<script>

	| space container  bar title |
	
	bar := self menuBar.
	title := self title.
	
	container := BlElement new
		             background: Color lightRed;
		             layout: BlLinearLayout vertical;
		             constraintsDo: [ :c |
			             c horizontal matchParent.
			             c vertical matchParent ].
	container addChildren: {
			bar.
			title
			}.

	space := BlSpace new.
	space root addChild: container.
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
				   fontSize: 100)) constraintsDo: [ :c |
			 c frame horizontal alignCenter.
			 c frame vertical alignCenter ]).
	^ title
]
