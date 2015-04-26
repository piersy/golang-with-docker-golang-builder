FROM phusion/baseimage:0.9.16
WORKDIR /

ADD server/server /server

#set up the server to be run as service by runit the phusion image's init system
RUN mkdir /etc/service/server
#create the script for running the server
RUN printf %"s\n" '#!/bin/bash' 'exec /server 2>&1 > /var/log/server' > /etc/service/server/run && chmod +x /etc/service/server/run


