FROM postgres

ENV POSTGRES_DB world
ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD docker


COPY world.sql /docker-entrypoint-initdb.d/

# Ajout des métadonnées
LABEL maintainer="Duvignau Yannis <yduvignau@iutbayonne.univ-pau.fr>"
LABEL description="Docker image pour la base de données PostgreSQL"