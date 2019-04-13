FROM FROM node:8.15.1-alpine

# Must Be a valid Camunda Modeler RELEASE version strictly SEMVER
ARG CAMUNDA_WEB_MODELER_VERSION=$CAMUNDA_WEB_MODELER_VERSION
ENV CAMUNDA_WEB_MODELER_VERSION=$CAMUNDA_WEB_MODELER_VERSION

# export CAMUNDA_WEB_MODELER_DOWNLOAD_URI="https://camunda.org/release/camunda-modeler/$CAMUNDA_WEB_MODELER_VERSION/camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64.tar.gz"
ARG CAMUNDA_WEB_MODELER_DOWNLOAD_URI=$CAMUNDA_WEB_MODELER_DOWNLOAD_URI
ENV CAMUNDA_WEB_MODELER_DOWNLOAD_URI=$CAMUNDA_WEB_MODELER_DOWNLOAD_URI

RUN apk update && apk add curl git tar

# Installing Camunda Modeler App
RUN curl -o ./camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64.tar.gz -L $CAMUNDA_WEB_MODELER_DOWNLOAD_URI
RUN mkdir /root/modeler
RUN tar -xvf ./camunda-modeler-3.0.1-linux-x64.tar.gz -C /root/modeler/

WORKDIR /root/modeler
RUN ls -allh
CMD ["/bin/sh"]
