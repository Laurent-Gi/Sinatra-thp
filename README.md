### Projet THP : The Gossip Project en Sinatra
La suite du projet de vendredi 


## Qu'est-ce que c'est ?

C'est une application pour gérer les potins chez THP 
L'application nous fait découvrir le framework sinatra (Ruby)


## Utilisation

Au choix : Faire un clone de Sinatra-thp sur GitHub, voire un fork, voire même copier le dossier sur GitHub.

A noter que j'utilise la version 2.7.1 de ruby... pour faire fonctionner shotgun, la commande "shotgun -p 4567" ne fonctionne pas correctement. Utiliser plutôt "bundle exec shotgun -p 4567" cf notice ci-dessous:

```
$ git clone https://github.com/Laurent-Gi/Sinatra-thp.git
$ bundle install
$ bundle exec shotgun -p 4567
```

Le site fonctionne donc en localhost sous le port 4567 : Ouvrir http/localhost:4567 dans votre navigateur habituel

## La base de données :

Elle est représentée par un fichier csv unique dans le répertoire db: gossip.csv

## Fonctionnalités

L'application nous permet :
#1 D'afficher tous les potins en page de garde
#2 De créer un nouveau potin
#3 D'afficher chaque potin dans une page à l'url dynamque qui lui est propre
#4 D'éditer et de modifier un potin existant


## Reste à faire
Je n'ai pas implémenté le Chapitre 2.8 sur la gestion des commentaires...
