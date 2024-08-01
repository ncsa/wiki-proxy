# wiki-proxy
proxied access to protected wiki

## Required packages
- [OpenResty](https://openresty.org/en/installation.html)
  - OpenResty is a collection of packages that includes a version of nginx and lua with additional lua modules
- [lua-resty-openidc (depends on lua-resty-http, lua-resty-session, lua-resty-jwt)](https://github.com/zmartzone/lua-resty-openidc)
  - This is the package that is used to authenticate users with an OpenID Connect provider
- [nginx](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/)
  - The standard nginx package

### Recommended packages
- [luarocks (lua package manager)](https://luarocks.org/)

## Setup CILogon Client
- [Confluence Guide](https://wiki.ncsa.illinois.edu/pages/viewpage.action?spaceKey=ICI&title=CiLogon+setup+process)
- The standard callback URL should be something like `https://<your-domain>/redirect_uri`

## Commands to Run Nginx
- Run the proxy: `sudo openresty`
  - Standard nginx: `nginx`
- Test syntax: `sudo openresty -t`
  - Standard nginx: `nginx -t`
- Reload the configuration: `sudo openresty -s reload`
  - Standard nginx: `nginx -s reload`
- Stop the server: `sudo openresty -s quit`
  - Standard nginx: `nginx -s quit`
- Specify the configuration file: `sudo openresty -c /path/to/nginx.conf`
  - Standard nginx: `nginx -c /path/to/nginx.conf`

## Proxy to Confluence
- The location has to be root, i.e. `location / {}`
- To the confluence website: `proxy_pass https://wiki.ncsa.illinois.edu` 
- Auto-login to an account: `proxy_set_header Authorization "Bearer <PAT>";`
  - PAT can be generated from the user's account settings
- Other heads are used to make sure the contents can be loaded. Some may be redundant or unrelated.

### Potential Issues
- Go to Find Spaces -> Click into a space will lead the user to the real address that starts 
with https://wiki.ncsa.illinois.edu
- The Analytics page does not work

### Authentication Error
The proxy is working, but the authentication isn't. The issue is described in the markdown in 
the folders:
- [CILogon authentication error](/CILogon/README.md)
- [Keycloak authentication error](/keycloak_test/README.md)
