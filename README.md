# description 

ce projet est une implémentation du classique jeu Bomberman "revisité".

il comprend un pleateau de jeu dynamique, un joueur et des bombes ansi que divers élements interactifs.
Le jeu vise à offrir une expérience amusante et enfafeante, mettant en oeuvre des mécanismes de jeu classique de bomberman avec des extensions personnalisées.

# utilisation 

1. Lancez le jeu depuis l'environnement de développement Pharo.
2. Utilisez les commandes du clavier pour déplacer votre joueur sur le plateau
3. Posez des bombes oiur éluminer les obtacles.
4. Atteignez l'obkectif


# choix 

nous avons repris la structure du jeu Sokoban pour la gestion du plateau et du player .
En effet dans Sokoban cette aspect etait déja fait 
on a donc ajouter la bombe et les interactions 

# a faire 

utilisation d'un disign pattern Strategy pour les élement ayant des comportements variés : 
exemples : les types de mouvements ou d'actions pour le player , cela permettrai de changer dynamiquement les algorithmes utilisés

utilisation du visitor pattern pour la gestions des interactions complexes entre types d'objets , comme les bombes , joueurs , murs


