# Compte Rendu Soutenance

**Lord Pascal Isak & Weber Loïc MIN1**

**Introduction**

Le but de ce mini projet était de simuler et tester un rover sur mars.  
Notre Makefile visualisé :  
![Moi_Isak_&_Curiosity](_niIUrXao-Moi_Isak_&_Curiosity)  
Si jamais l'archive ne marche pas ou si il y a une gros probleme : https://github.com/JustAlternate/TP9

**TP7**

Au total nous avons créer 11 fichiers tests appelés 'programme_test\_%', c'est fichiers ainsi que leurs terrains et leur programmes respectifs sont situés dans le dossier 'fichiers_test_TP7'

Afin de faciliter leurs execution nous avons fait des fichiers bash que vous pouvez tous executé manuellement (en allant dans leurs dossier respectifs) ou bien en faisant un make tests qui lancera TOUT les fichiers bash de tests)  
La plupart de ces tests sont des tests de robustesse, de limite et de resilience  
Pour trouver ces tests nous nous sommes mis a la place du robot et nous nous sommes demandée quelle étaient les actions faisable ?  
ainsi nous avons des tests sur :

- Toutes les commandes utilisable par le robot.
- Les Boucles imbriquées
- Les groupe de commande '{}'
- Les groupe de commandes imbriques'{{}{}}'
- Les commandes Ignore et Rotation 'I' & 'R'
- Rencontre d'obstacle (Eau, Rocher)
- Sortie de terrains
- Programme trop grand
- Division par 0

**TP8**

**Generation Aléatoire** :

Les terrains sont générés en deux temps :

1. Le terrain est créer case par case. Pour chaque case un nombre est tiré aléatoirement puis ramené sur un intervalle entre 0 et 1 (nb/RAND_MAX converti en flottant) et, si il est inférieur à la probabilité demandé, la case est un rocher, sinon, la case est une case libre. Cas spécial : la case du millieu est l'emplacement de départ du robot.
2. Un test est réalisé pour savoir si un chemin existe entre le millieu et le centre (case départ du robot). Ce test est réalisé avec la fonction fournie. Si un chemin existe, alors le terrain est correcte et peut être utilisé (a la fin on retourne le terrain)

**Les programmes infinis**

**Programme n°1 :**

`{1M{}{AC!}?}C! {1M{G}{AD}?C!}C!`  
Le but de ce programme est de longer le coté droit vers le bas jusqua trouver l'arrivé.  
Une variante serait donc : `{1M{}{AC!}?}C! {1M{D}{AG}?C!}C!` qui longe a gauche.

```
###SORTIE         ###SORTIE
#######.#         #######n#
>..#.##.#         >ab#.##m#
##...#..#         ##cd.#.l#
..#.....#         ..#e.ijk#
###...###         ###fgh###
#########         #########
```

Seul probleme : Il peut arriver que le programme tourne autour d'un caillou comme dans ce terrain çi dessous

```
.abc.
.>#d.
.gfe.
```

Statistiques (prennait trop de place, donc voir le fichier 'statistiques.md')

**Programme n°3 :**

`{1M{ 7M{D}{G}?}{A}? C!}C!`  
Ce programme avance tout droit jusqua rencontré un obstacle, des qu'il voit un obstacle devant lui il regarde si il y a un obstacle a sa gauche. Si il n'y en a pas alors il se tourne a gauche sinon il se tourne a droite et reboucle.

```
SORTIE      SORTIE
.#..#.      .#..#.
#>...#      #>abc#
#....#      #i..d#
#....#      #hgfe#
.#..#.      .#..#.
SORTIE      SORTIE
```

Statistiques (prennait trop de place, donc voir le fichier 'statistiques.md')

Conclusion sur les statistiques :  
Le programme 3 trouve en moyenne plus vite la sortie que le programme 1 mais le programme 1 trouve plus souvent la sortie.

**TP9**

L'observateur proposé était de vérifier qu'avant chaque commande Avancer 'A' on est une commande mesurer 'M'. Nous avons donc apres avoir coder cette observateur réfléchis a l'améliorer en lui donnant cette règle :

`'Avoir toujours fait une mesure avant d'aller dans une direction.'`

Donc si le programme veut avancer a droite ('DA') il devra faire une mesure sur la droite, avant : ('7MGA') ou bien si le programme veut avancer a gauche ('GA') il devra faire une mesure sur la gauche avant : ('3MDA') et pareil si il veut avancer tout droit.  
Enfin nous ajoutons une règle qui permet au programme de faire n'importe quelle commande (sauf Avancer, Gauche et Droit) entre les commande M, G/D et A.

Ce qui rend : ('1M 6M 7M 8M A') valide, ainsi que ('3M 4P 12 G I 8 A') valide
par contre ('7M D GA') ou ('3MG D A') invalide car le programme a changer sa direction apres la mesure et avant d'avancer.

Voici l'automate reprensentatif de notre observateur : ('\*' signifie toutes les commandes et '\*\G' signifie tout sauf commande Gauche)  
![Automate](JYBvpk_nv-Automate)  
Conclusion du Projet :  
Nous sommes tres satisfait des programmes que nous avons pu écrire, on a bien compris comment se servir du Makefile et l'enjeu de faire des tests cependant nous avons eu un peu de mal lors d'un TP car il fallait reprendre un TP précédent et que dans celui çi on était assez libre, pourtant au TP suivant a cause des nouveau fichiers, notre TP précédents ne marché plus, ce qui nous avait pris beaucoup de temps a réparer :/ Il y avait aussi plusieurs bug dans certains fichiers source.
