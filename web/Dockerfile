# Installation de l'image python de base
FROM python:3.11-slim

# Se déplacer dans l'espace de travail
WORKDIR /app

# faire le build de l'image
RUN pip install flask psycopg2-binary
# Copie de tout le contenu dans le dossier local
COPY . /app

# Précision du port
EXPOSE 5000

# Lancement du serveur Flask
ENTRYPOINT flask run --host=0.0.0.0
 
# Commande lancée (ajout à ENTRYPOINT)
CMD [ "app.py" ]

# Ajout des métadonnées
LABEL maintainer="Duvignau Yannis <yduvignau@iutbayonne.univ-pau.fr>"
LABEL description="Docker image pour le service web Python Flask"
