# Nexus Repository Manager with Docker Support

This is a template for deploying Nexus Repository Manager behind an NGINX reverse proxy.

## Features

- Web UI accessible via https://localhost
- Docker Hub proxy registry accessible via https://localhost:5000

## Operations

To create and run the Nginx proxy, Nexus Repository Manager and DockerHub proxy, run:

```
./nexus.sh
```

To stop, use docker-compose:

```
docker-compose down
```

## SSL Certificates

The Ngnix docker image build process generates insecure SSL certificates with fake location information and CNAME of localhost. Understand the risks of using these SSL certificates before proceeding. A deployed solution should use a valid CA certificate.