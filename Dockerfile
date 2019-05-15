FROM docker:latest
MAINTAINER "Akito Nozaki <anozaki@onica.com>"

ENV TERRAFORM_VERSION=0.11.10
#ENV RUNWAY_VERSION=0.20.1

RUN apk add --no-cache nodejs nodejs-npm python python-dev py-pip build-base bash curl git

RUN npm i serverless -g \
 && pip install pipenv runway --user \
 && cd /tmp \
 && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
 && mv terraform /usr/local/bin \
 && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN rm -rf /root/.cache /root/.npm

RUN mkdir /src
ENV PYENV_ROOT=/.pyenv \
    PATH=/.pyenv/bin:/root/.local/bin/:$PATH
RUN apk update \
 && apk add python3 python3-dev libffi-dev openssl-dev

RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash \
 && pyenv update

RUN echo 'eval "$(pyenv init -)"' >> .profile
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> .profile

WORKDIR /src
