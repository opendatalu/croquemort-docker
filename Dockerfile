FROM debian:jessie
MAINTAINER petzlux "pweber@spatialbit.com"

# Set local environment proxy
ENV http_proxy http://proxy.etat.lu:8080
ENV https_proxy http://proxy.etat.lu:8080

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python3 python3-pip

WORKDIR /root
RUN pip3 install honcho
RUN pip3 install croquemort
COPY Procfile .
COPY config.yaml .
COPY wait-for-it/wait-for-it.sh .
RUN chmod +x wait-for-it.sh
CMD honcho start
