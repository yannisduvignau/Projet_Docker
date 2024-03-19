# Application python avec Flask et PostgreSQL

Ce projet est une application web Python avec une base de données PostgreSQL à l'aide de Docker. Utilisez Dockerfile pour construire les images des conteneurs Python et PostgreSQL, et Docker Compose pour orchestrer le déploiement.

## MetaDonnées

- auteur : Yannis DUVIGNAU
- date de création : 21/02/2024
- date de rendu : 22/02/2024

## Architecture

projet-docker/
│
├── sql/
│    └── Dockerfile # Fichier Docker pour construire l'image de Postgres
│    └── world.sql # Fichier SQL contenant les données initiales à charger dans la BDD
├── web/
│    └── app.py # Fichier principal de l'application Python
│    └── Dockerfile # Fichier Docker utilisé pour construire l'image de l'application python avec Flask
│    └── templates/
│    └── index.html # Fichier HTML pour afficher les données de la base de données
├── docker-compose.yml # Fichier Docker Compose qui permet d'orchestrer plusieurs conteneurs
└── README.md # Ce fichier README

## Installation

### Etape 1

Pour commencer, il faut créer le Dockerfile pour l'application web Python.

1. Il faut trouver une image Python récente, qui fonctionne pour notre projet et qui ne pèse pas lourd, à savoir "python:3.11-slim".
2. Ajoutez les paramètres nécessaires tels que l'espace de travail, le port et la commande d'exécution.
3. Il faut ensuite tester en créant un premier conteneur basé sur cette nouvelle image :
   - docker build -t projet_docker .
   - docker run -p 5000:5000 -d --name serverWeb projet_docker

### Etape 2

Ensuite, il faut créer le dockerfile pour la base de données PostgreSQL.

1. Il faut trouver une image PostgreSQL qui est récente, qui fonctionne pour notre projet et qui ne pèse pas lourd, à savoir "postgres".
2. Ajoutez les paramètres nécessaires tels que les variables d'environnement (Database, user et password) et l'initialisation des données de base dans la BD.
3. Il faut ensuite tester en créant un deuxème conteneur basé sur cette nouvelle image :
   - docker build -t sql_image .
   - docker run -p 5432:5432 -d --name postgresdb_container sql_image
   - docker exec -it postgresdb_container /bin/bash
     └── psql -U docker -d world
     └── \dt
     └── SELECT * FROM CD;
4. Vérifieé que la table apparaît bien

### Etape 3

Puis, il faut crée une entrée dans `docker-compose.yml` pour faciliter la création de toutes les images. 

1. Tout d'abord, il faut spécifier chaque service (web, database et pgadmin) et ensuite spécifier les paramètres pour chacun.
2. Pour les services web et database, les images ont été créées depuis leurs Dockerfiles respectifs donc on crée les services avec l'attribut build qui permet de spécifier la création du service en fonction de l'image renseignée.
3. Ensuite, il faut spécifier les ports, les réseaux, les volumes et les noms des conteneurs.
4. Pour ce qui est du pgadmin (phpmyadmin pour PostgreSQL), l'image existe (dpage/pgadmin4), il ne reste plus qu'à ajouter des variables d'environnement telles que l'email par défaut et le mot de passe par défaut.
5. On ajoute des "depends on" qui vont nous servir à donner un ordre dans l'exécution et la création de nos services (par exemple : l'application Python doit attendre que la base de données soit créée pour pouvoir se lancer).
6. Enfin on spécifie les volumes nécessaires et on lance le docker compose :
    - docker-compose up -d
Maintenant vous pouvez accéder au site via localhost:5000 et à la BDD via localhost:5050

### Etape 4

Pour finir, maintenant que la base de données et le serveur web sont en place, il faut vérifier que la connexion entre les deux se fait bien et pour cela, on va modifier l'application Python.

1. Premièrement, on importe Flask qui va nous servir pour l'exécution de Python côté web. On importe également render_template pour envoyer les données dans un index.html. Et enfin, on importe psycopg qui sert à faire la connexion à la BDD en PostgreSQL.
2. Deuxiemement, il faut créer l'application et la connexion.
3. Enfin, on récupère les informations dans la base de données et on les envoie à l'index.html.
