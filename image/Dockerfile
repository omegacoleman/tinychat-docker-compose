FROM fedora:30

MAINTAINER You Cai <omegacoleman@gmail.com>

RUN dnf clean all
RUN dnf update -y

RUN yum install -y cmake make gcc gcc-c++ nodejs npm boost-devel protobuf protobuf-devel libstdc++-static

RUN npm install -g yarn

RUN yum install -y nginx redis

COPY ./tinychat /tinychat

RUN yum install -y openssl-devel

RUN mkdir /tinychat/build && cd /tinychat/build && cmake .. && make

RUN cd /tinychat/client-webui/invreg && yarn install

RUN yarn global add pm2

CMD ["/bin/bash", "/data/run-all.sh"]
