# Start with an official OpenResty base image
FROM openresty/openresty:centos

# Set environment variables for defautls
ENV FQDN=localhost
ENV DNS_RESOLVER="141.142.2.2 141.142.230.144"

# Set work directory 
WORKDIR /

# Installs lua_resty_openidc 
RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-openidc 

# Copy custom nginx.conf
COPY ./CILogon/nginx.conf.template /usr/local/openresty/nginx/conf/

CMD ["/bin/sh", "-c", "envsubst < /usr/local/openresty/nginx/conf/nginx.conf.template > /usr/local/openresty/nginx/conf/nginx.conf && openresty -g 'daemon off;'"]
