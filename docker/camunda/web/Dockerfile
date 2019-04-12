FROM node-alpine:latest

ARG CAMUNDA_WEB_MODELER_DOWNLOAD_URI=https://camunda.org/release/camunda-modeler/3.0.1/camunda-modeler-3.0.1-linux-x64.tar.gz?__hstc=252030934.59a534bad9bec6b14b3a027886e30596.1555081391198.1555081391198.1555081391198.1&__hssc=252030934.5.1555081818554&__hsfp=384427876
ENV CAMUNDA_WEB_MODELER_DOWNLOAD_URI=$CAMUNDA_WEB_MODELER_DOWNLOAD_URI

ARG NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER=$NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER
ENV NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER=$NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER




RUN apk update && apk add curl git tar

# Installing Camunda Modeler App
RUN curl -L $CAMUNDA_WEB_MODELER_DOWNLOAD_URI -o camunda-modeler-3.0.1-linux-x64.tar.gz
RUN mkkdir ~/modeler
RUN tar -xvf ./camunda-modeler-3.0.1-linux-x64.tar.gz -C ~/modeler/
RUN chmod +x ~/modeler/camunda-modeler.sh

WORKDIR ~/modeler 

EXPOSE $NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER/tcp
# Running as root, shoudl be changed to an non-root user, with 
# sufficient permissions, regarding what the camunda modeler 
# app needs to be authrorized to do
CMD ["/root/modeler/camunda-modeler.sh"]
