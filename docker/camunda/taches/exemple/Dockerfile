# FROM openjdk:7-jre-alpine
FROM node:8.15.1-alpine


# https://docs.camunda.org/get-started/quick-start/service-task/#implement-the-nodejs-script
# The Task runner actualy polls, pobably to register to Camunda bpmn engine;
ARG POLLING_HOST=$POLLING_HOST
ENV POLLING_HOST=$POLLING_HOST

ARG POLLING_PORT=$POLLING_PORT
ENV POLLING_PORT=$POLLING_PORT

ARG CONDUITE_IO_TASK_NAME=$CONDUITE_IO_TASK_NAME
ENV CONDUITE_IO_TASK_NAME=$CONDUITE_IO_TASK_NAME


ARG NUM_PORT_ECOUTE_PEGASUS_TASK_IN_CONTAINER=$NUM_PORT_ECOUTE_PEGASUS_TASK_IN_CONTAINER
ENV NUM_PORT_ECOUTE_PEGASUS_TASK_IN_CONTAINER=$NUM_PORT_ECOUTE_PEGASUS_TASK_IN_CONTAINER




# Node Env
ENV NODE_ENV=production



RUN apk update && apk add curl git tar

# Installing Camunda Task implementation Source Code (Shoudl later be a git cloned from a versioned source code referential, like a git repo )
RUN mkdir /root/pegasus-task


# BUILD APP
ADD task-implementation-source/ /root/pegasus-task/
RUN npm install

USER root

WORKDIR /root/modeler/client

EXPOSE $NUM_PORT_ECOUTE_PEGASUS_TASK_IN_CONTAINER/tcp
# Running as root, shoudl be changed to an non-root user, with
# sufficient permissions, regarding what the camunda modeler
# app needs to be authrorized to do
# CMD ["/bin/sh"]
CMD ["/usr/local/bin/node", "worker.js"]
