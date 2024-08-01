# Start with an official OpenResty base image
FROM openresty/openresty:centos

# Set work directory 
WORKDIR /

# Installs lua_resty_openidc 
RUN /usr/local/openresty/luajit/bin/luarocks install lua-resty-openidc 

# Copy custom nginx.conf
COPY ./CILogon/nginx.conf.template /usr/local/openresty/nginx/conf/

CMD ["/bin/sh", "-c", "envsubst < /usr/local/openresty/nginx/conf/nginx.conf.template > /usr/local/openresty/nginx/conf/nginx.conf && openresty -g 'daemon off;'"]



