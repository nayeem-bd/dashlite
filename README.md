# Dashlite - Laravel Application

This repository contains the configuration and deployment setup for the Dashlite Laravel application, including Kubernetes, Helm, Docker, and Nginx configuration.

## Prerequisites

- **Kubernetes Cluster** (e.g., using Minikube, Kind, or a cloud provider)
- **Helm** installed (for deploying charts)
- **kubectl** installed (for interacting with Kubernetes clusters)
- **Docker** installed (for building and pushing Docker images)

## Deployment Overview

1. **Helm Chart**: The deployment uses Helm to manage Kubernetes resources like Deployments, Services, and ConfigMaps.
2. **Kubernetes**: This application is deployed in a Kubernetes environment.
3. **Nginx and PHP-FPM**: The application is served using Nginx with PHP-FPM for backend processing.

## Installation and Deployment

### 1. Package the Helm Chart

Make sure you're in the root directory of the project, then run the following command to package the chart:

```bash
helm package /deployment
```

### 2. Deploy using helm

```bash
helm upgrade --install dashlite ./dashlite-0.1.0.tgz --namespace dashlite --create-namespace
```
