FROM docker:latest
MAINTAINER "Akito Nozaki <anozaki@onica.com>"

ENV TERRAFORM_VERSION=0.11.10
#ENV RUNWAY_VERSION=0.20.1

RUN apk add --no-cache nodejs nodejs-npm python python-dev py-pip build-base bash

RUN npm i serverless -g \
 && pip install stacker stacker_blueprints runway --user \
 && cd /tmp \
 && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 && mv terraform /usr/local/bin \
 && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN rm -rf /root/.cache /root/.npm

RUN mkdir /src
ENV PATH=/root/.local/bin/:$PATH

RUN apk update \
 && apk add python3


WORKDIR /src
