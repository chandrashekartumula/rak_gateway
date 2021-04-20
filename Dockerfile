#!/bin/sh

FROM --platform=linux/arm/v7 alpine

ENV PROJECT_PATH=/home
#ARG TARGETPLATFORM
RUN apk add make git bash gcc g++
RUN apk add --no-cache wget


WORKDIR $PROJECT_PATH
COPY . $PROJECT_PATH
#RUN git clone --depth=1 https://github.com/chandrashekartumula/lorawan.git


RUN ./install.sh
#CMD ["install.sh"]
#added g++ compiler and platfrom spec
