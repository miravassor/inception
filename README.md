# Inception

## Overview

The Inception project is about system administration through the application of Docker virtualization. 
This project construct a network infrastructure that hosts a range of services. Each service  operate within its own dedicated Docker container. My containers are based on Debian.

## Objectives

- Virtualize services using Docker.
- Use Docker Compose to manage containers.
- Build custom Docker images with Dockerfiles.
- Ensure containers are isolated and use volumes for data persistence.
- Implement network communication between containers.

## Requirements

- Docker and Docker Compose installed.

## Services

- **Nginx Container**: Runs Nginx (TLSv1.2 TLSv1.3)
- **WordPress Container**: Contains WordPress and php-fpm, without Nginx.
- **MariaDB Container**: Contains MariaDB database, without Nginx.

## Volumes

- A volume for WordPress database.
- A volume for WordPress website files.

## Network

- Docker network to connect containers.
