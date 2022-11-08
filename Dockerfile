FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt install -y tcl &&\
    apt-get install ansible wget unzip python3-pip -y
