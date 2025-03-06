# OpenResty Reverse Proxy with CILogon OIDC Authentication

This repository contains the setup and configuration for deploying an OpenResty-based reverse proxy (version openresty/1.27.1.1) that uses CILogon for OpenID Connect (OIDC) authentication. The reverse proxy also supports SSL to ensure secure communication with the backend website. 

## Features

- **Reverse Proxy**: Acts as an intermediary between users and a backend website.

- **OIDC Authentication**: Uses CILogon to authenticate users before granting access to the proxied website. After successful authentication, users are logged in as a service account to interact with the backend.

- **SSL Support**: Ensures secure communication with the proxied backend.

## Prerequisites

- **Docker**: Ensure that Docker is installed and running on your system.

- **CILogon Client**: Register your application with CILogon and obtain the necessary client credentials (Client ID and Client Secret).

## Using the Pre-Built Image

1. Pull the pre-built image:

```
docker pull ghcr.io/ncsa/wiki-proxy:production
```

2. Run the Docker container
```
docker run \
  -e CLIENT_ID='...' \
  -e CLIENT_SECRET='...' \
  -e PAT='...' \
  -e PROXY_FQDN='...' \
  -e TARGET_FQDN='...' \
  -p 443:443 \
  -p 80:80 \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -v /etc/ssl/:/etc/ssl/ \
  ghcr.io/ncsa/wiki-proxy:production 
```

## Configuration Details

### NGINX Configuration Highlights
**OIDC Authentication**: The nginx.conf includes directives to handle OIDC authentication using lua-resty-openidc. It validates tokens and ensures only authenticated users can access the proxied backend.

**SSL Setup**: The configuration enforces HTTPS and uses the provided SSL certificate and key.

**Reverse Proxy**: Requests are forwarded to the backend website, with appropriate headers set to ensure compatibility.

### Environment Variables
- `CLIENT_ID`: The client id given by the OIDC provider
- `CLIENT_SECRET`: The client secret given by the OIDC provider
- `PAT`: The Personal Access Token for the service account
- `PROXY_FQDN`: The URL of the proxy 
- `TARGET_FQDN`: The URL of the backend site 

## Troubleshooting

- **Authentication Errors**: Ensure that the CILogon Client ID, Client Secret, and Discovery URL are correctly configured.

- **SSL Errors**: Verify that the paths to your SSL certificate and private key are correct.

- **Proxy Issues**: Confirm that the backend URL is reachable.