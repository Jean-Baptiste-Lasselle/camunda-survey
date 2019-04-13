# FROM openjdk:7-jre-alpine
FROM node:8.15.1-alpine

ARG CAMUNDA_WEB_MODELER_DOWNLOAD_URI=$CAMUNDA_WEB_MODELER_DOWNLOAD_URI
ENV CAMUNDA_WEB_MODELER_DOWNLOAD_URI=$CAMUNDA_WEB_MODELER_DOWNLOAD_URI

# https://github.com/camunda/camunda-modeler
ARG CAMUNDA_WEB_MODELER_GIT_SCM_URI=$CAMUNDA_WEB_MODELER_GIT_SCM_URI
ENV CAMUNDA_WEB_MODELER_GIT_SCM_URI=$CAMUNDA_WEB_MODELER_GIT_SCM_URI

# Must Be a valid Camunda Modeler RELEASE version strictly SEMVER
ARG CAMUNDA_WEB_MODELER_VERSION=$CAMUNDA_WEB_MODELER_VERSION
ENV CAMUNDA_WEB_MODELER_VERSION=$CAMUNDA_WEB_MODELER_VERSION

# Network
ARG NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER=$NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER
ENV NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER=$NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER

# Node Env
ENV NODE_ENV=production



RUN apk update && apk add curl git tar

# Installing Camunda Modeler App
# RUN curl -o ./camunda-modeler-3.0.1-linux-x64.tar.gz -L $CAMUNDA_WEB_MODELER_DOWNLOAD_URI
RUN mkdir /root/modeler
# RUN tar -xvf ./camunda-modeler-3.0.1-linux-x64.tar.gz -C /root/modeler/
WORKDIR /root/modeler
RUN git clone $CAMUNDA_WEB_MODELER_GIT_SCM_URI .
RUN git checkout "v$CAMUNDA_WEB_MODELER_VERSION"



# BUILD APP
ADD build-camunda-modeler.sh .
RUN chmod +x ./build-camunda-modeler.sh
RUN ./build-camunda-modeler.sh

ADD ./start-camunda-modeler.sh .
RUN cp ./start-camunda-modeler.sh /root/modeler/client/
RUN chmod +x /root/modeler/client/start-camunda-modeler.sh


# RUN pwd && ls -allh
# RUN ls -allh /root/modeler/camunda-modeler-3.0.1-linux-x64
# RUN chmod +x /root/modeler/camunda-modeler-3.0.1-linux-x64/camunda-modeler
# RUN ls -allh /root/modeler/camunda-modeler-3.0.1-linux-x64/camunda-modeler
# RUN cat ~/modeler/camunda-modeler-3.0.1-linux-x64/camunda-modeler
# RUN chmod +x ~/modeler/camunda-modeler-3.0.1-linux-x64/camunda-modeler.sh

USER root

WORKDIR /root/modeler/client

EXPOSE $NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER/tcp
# Running as root, shoudl be changed to an non-root user, with
# sufficient permissions, regarding what the camunda modeler
# app needs to be authrorized to do
# CMD ["/root/modeler/camunda-modeler-3.0.1-linux-x64/camunda-modeler"]
# CMD ["/bin/sh"]
# CMD ["/usr/local/bin/npm", "start"]
CMD ["/root/modeler/client/start-camunda-modeler.sh"]
