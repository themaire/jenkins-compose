# Stage 1: Build Docker tools
FROM docker:latest AS docker-tools

# Stage 2: Jenkins
FROM jenkins/jenkins:latest

USER root

# Copier docker et docker-compose depuis l'étape précédente
COPY --from=docker-tools /usr/local/bin/docker /usr/local/bin/docker
COPY --from=docker-tools /usr/local/bin/docker-compose /usr/local/bin/docker-compose

# Exposer le port de Jenkins
EXPOSE 8090
