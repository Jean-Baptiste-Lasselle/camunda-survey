FROM openjdk:7-jre-alpine

ARG CAMUNDA_WEB_MODELER_DOWNLOAD_URI=$CAMUNDA_WEB_MODELER_DOWNLOAD_URI
ENV CAMUNDA_WEB_MODELER_DOWNLOAD_URI=$CAMUNDA_WEB_MODELER_DOWNLOAD_URI

ARG NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER=$NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER
ENV NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER=$NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER


RUN apk update && apk add curl git tar

# Installing Camunda Modeler App
RUN curl -o ./camunda-modeler-3.0.1-linux-x64.tar.gz -L $CAMUNDA_WEB_MODELER_DOWNLOAD_URI
RUN mkdir /root/modeler
RUN tar -xvf ./camunda-modeler-3.0.1-linux-x64.tar.gz -C /root/modeler/

RUN pwd && ls -allh
RUN ls -allh /root/modeler/camunda-modeler-3.0.1-linux-x64
RUN chmod +x /root/modeler/camunda-modeler-3.0.1-linux-x64/camunda-modeler
RUN ls -allh /root/modeler/camunda-modeler-3.0.1-linux-x64/camunda-modeler
# RUN cat ~/modeler/camunda-modeler-3.0.1-linux-x64/camunda-modeler
# RUN chmod +x ~/modeler/camunda-modeler-3.0.1-linux-x64/camunda-modeler.sh

USER root

WORKDIR /root/modeler/camunda-modeler-3.0.1-linux-x64/ 

EXPOSE $NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER/tcp
# Running as root, shoudl be changed to an non-root user, with 
# sufficient permissions, regarding what the camunda modeler 
# app needs to be authrorized to do
# CMD ["/root/modeler/camunda-modeler-3.0.1-linux-x64/camunda-modeler"]
CMD ["/bin/sh"]

