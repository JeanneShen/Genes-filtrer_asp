# Genes-filtrer_asp
Identification d’ensembles de gènes par programmation logique (ASP)

**Mots clés**: Intelligence artificielle, graphes, combinatoire, programmation logique

  L’objectif de ce projet est de concevoir un programme logique en Answer Set Programming, ASP qui, étant donné une matrice booléenne de taille m × n, permet de construire une sous-matrice en assemblant
quelques colonnes et quelques lignes selon les critères suivants :
1. Sélectionner un sous-ensemble K composé de k gènes (k est un paramètre du programme), à partir
de toutes les combinaisons possibles sur les choix possibles des n gènes.
2. Sélectionner des paires des cellules pour lesquelles les valeurs booléennes des k gènes choisis coïncident
pour les 2 stades de développement (M et T E). Les vecteurs booléens construits ainsi doivent être
differents pour un même stade de développement.
3. Maximiser le nombre des paires des cellules appartenant à des stades différents (Eq. 1).
![image](https://user-images.githubusercontent.com/96447405/219510587-27174709-800c-49ba-abb8-8746c39dbd2f.png)

  Les données d’entrée de ce programme seront la matrice M, ainsi que les stades du développement des
cellules dans M. Une version similaire du problème a été abordé dans [2] sans que soit applicable aux données
de développement embryonnaire. Une fois ce problème constitué de deux stades de développement M et T E
résolu, la deuxième partie du projet sera de proposer une généralisation de ce problème pour S stades de
développement différents et donner les limites de calcul pour la taille de S en fonction de la dimension de la
matrice M. Nous disposons des données réelles pour S = 5.
