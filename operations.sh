#/bin/bash

export NOM_DU_RESEAU_DEMO_CAMUNDA=reseau_camunda

# Camunda Engine
export NUM_PORT_ECOUTE_CAMUNDA_ENGINE_IN_CONTAINER=8080
export NUM_PORT_ECOUTE_CAMUNDA_ENGINE=8091

# Camunda Web client
export NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER=8080
export NUM_PORT_ECOUTE_CAMUNDA_WEB=8092

export CAMUNDA_WEB_MODELER_DOWNLOAD_URI=https://camunda.org/release/camunda-modeler/3.0.1/camunda-modeler-3.0.1-linux-x64.tar.gz?__hstc=252030934.59a534bad9bec6b14b3a027886e30596.1555081391198.1555081391198.1555081391198.1&__hssc=252030934.5.1555081818554&__hsfp=384427876

# 
# >>>>>  Interpolation de l'environnement Docker.
# 

# Camunda Engine
sed -i "s#NUM_PORT_ECOUTE_CAMUNDA_ENGINE_IN_CONTAINER_JINJA2_VAR#$NUM_PORT_ECOUTE_CAMUNDA_ENGINE_IN_CONTAINER#g" ./.env
sed -i "s#NUM_PORT_ECOUTE_CAMUNDA_ENGINE_JINJA2_VAR#$NUM_PORT_ECOUTE_CAMUNDA_ENGINE#g" ./.env
# Camunda Web client
sed -i "s#NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER_JINJA2_VAR#$NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER#g" ./.env
sed -i "s#NUM_PORT_ECOUTE_CAMUNDA_WEB_JINJA2_VAR#$NUM_PORT_ECOUTE_CAMUNDA_WEB#g" ./.env
sed -i "s#CAMUNDA_WEB_MODELER_DOWNLOAD_URI_JINJA2_VAR#$CAMUNDA_WEB_MODELER_DOWNLOAD_URI#g" ./.env


# 
# Fichiers interpolés secondaires : 
# => Il s'agit des fichiers qui utilisent des variables qui ne peuvent être interpolées par l'environnement docker.
# 
sed -i "s#NOM_DU_RESEAU_DEMO_CAMUNDA_JINJA2_VAR#$NOM_DU_RESEAU_DEMO_CAMUNDA#g" ./docker-compose.yml
sed -i "s#NOM_DU_RESEAU_DEMO_CAMUNDA_JINJA2_VAR#$NOM_DU_RESEAU_DEMO_CAMUNDA#g" ./.env

