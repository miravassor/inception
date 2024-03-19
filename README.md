# Inception

## Overview

The Inception project expands your system administration skills by virtualizing multiple Docker images within a virtual machine, focusing on Docker. 
You'll create a small infrastructure of various services, each in its container, using either Alpine or Debian as a base.

## Objectives

- Virtualize services using Docker.
- Use Docker Compose to manage containers.
- Build custom Docker images with Dockerfiles.
- Ensure containers are isolated and use volumes for data persistence.
- Implement network communication between containers.

## Requirements

- Docker and Docker Compose installed.

## Services

- **Nginx Container**: Runs Nginx
- **WordPress Container**: Contains WordPress and php-fpm, without Nginx.
- **MariaDB Container**: Contains MariaDB database, without Nginx.

## Volumes

- A volume for WordPress database.
- A volume for WordPress website files.

## Network

- Docker network to connect containers.

## Building and Running

- **Build Images**: Use `make` to build Docker images from your Dockerfiles specified in `docker-compose.yml`.
- **Run Containers**: Use `docker-compose up` to start your containers based on the configurations.
