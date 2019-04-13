# FROM openjdk:7-jre-alpine
FROM node:8.15.1-alpine 


# https://docs.camunda.org/get-started/quick-start/service-task/#implement-the-nodejs-script
# The Task runner actualy polls, pobably to register to Camunda bpmn engine;
ARG POLLING_HOST=$POLLING_HOST
ENV POLLING_HOST=$POLLING_HOST

ARG POLLING_PORT=$POLLING_PORT
ENV POLLING_PORT=$POLLING_PORT


# Node Env
ENV NODE_ENV=production



RUN apk update && apk add curl git tar

# Installing Camunda Modeler App
# RUN curl -o ./camunda-modeler-3.0.1-linux-x64.tar.gz -L $CAMUNDA_WEB_MODELER_DOWNLOAD_URI
RUN mkdir /root/pegasus-task
# RUN tar -xvf ./camunda-modeler-3.0.1-linux-x64.tar.gz -C /root/modeler/
WORKDIR /root/pegasus-task

# BUILD APP
ADD task-implementation-source/* /root/pegasus-task
RUN npm install

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

EXPOSE $NUM_PORT_ECOUTE_PEGASUS_TASK_IN_CONTAINER/tcp
# Running as root, shoudl be changed to an non-root user, with 
# sufficient permissions, regarding what the camunda modeler 
# app needs to be authrorized to do
# CMD ["/bin/sh"]
CMD ["/usr/local/bin/node", "worker.js"]
