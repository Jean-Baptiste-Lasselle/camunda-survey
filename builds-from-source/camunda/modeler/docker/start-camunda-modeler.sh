#!/bin/sh

echo " + STARTUP CAMUNDA + VERIF [NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER=$NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER]"
npm start -- --host 0.0.0.0 --port $NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER