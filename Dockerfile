FROM phusion/baseimage:0.9.16
WORKDIR /

ENV EXE_NAME golang_with_docker

ADD $EXE_NAME /$EXE_NAME

#set up the server to be run as service by runit the phusion image's init system
RUN mkdir /etc/service/$EXE_NAME
#create the script for running the server
RUN printf %"s\n" '#!/bin/bash' 'exec /$EXE_NAME 2>&1 > /var/log/$EXE_NAME' > /etc/service/$EXE_NAME/run && chmod +x /etc/service/$EXE_NAME/run


