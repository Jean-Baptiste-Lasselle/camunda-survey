#/bin/bash

export NOM_DU_RESEAU_DEMO_CAMUNDA=reseau_camunda

# Camunda Engine
export NUM_PORT_ECOUTE_CAMUNDA_ENGINE_IN_CONTAINER=8080
export NUM_PORT_ECOUTE_CAMUNDA_ENGINE=8091

# Camunda Web client
export NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER=8080
export NUM_PORT_ECOUTE_CAMUNDA_WEB=8092


# 
# https://github.com/camunda/camunda-modeler
export CAMUNDA_WEB_MODELER_GIT_SCM_URI=https://github.com/camunda/camunda-modeler

# 
# Must Be a valid Camunda Modeler RELEASE version strictly SEMVER
# 
export CAMUNDA_WEB_MODELER_VERSION=3.0.1
export CAMUNDA_WEB_MODELER_DOWNLOAD_URI="https://camunda.org/release/camunda-modeler/$CAMUNDA_WEB_MODELER_VERSION/camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64.tar.gz"

# RUN OPTIONS FOR CAMUNDA MODELER
export CAMUNDA_WEB_MODELER_OPTIONS=""


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

sed -i "s#CAMUNDA_WEB_MODELER_GIT_SCM_URI_JINJA2_VAR#$CAMUNDA_WEB_MODELER_GIT_SCM_URI#g" ./.env
sed -i "s#CAMUNDA_WEB_MODELER_VERSION_JINJA2_VAR#$CAMUNDA_WEB_MODELER_VERSION#g" ./.env

# Camunda Modeler Desktop ElectronJS App
sed -i "s#CAMUNDA_WEB_MODELER_OPTIONS_JINJA2_VAR#$CAMUNDA_WEB_MODELER_OPTIONS#g" ./.env



# 
# Fichiers interpolés secondaires : 
# => Il s'agit des fichiers qui utilisent des variables qui ne peuvent être interpolées par l'environnement docker.
# 
sed -i "s#NOM_DU_RESEAU_DEMO_CAMUNDA_JINJA2_VAR#$NOM_DU_RESEAU_DEMO_CAMUNDA#g" ./docker-compose.yml
sed -i "s#NOM_DU_RESEAU_DEMO_CAMUNDA_JINJA2_VAR#$NOM_DU_RESEAU_DEMO_CAMUNDA#g" ./.env


docker-compose down --rmi all && docker system prune -f && docker-compose up -d

# Now we should find Camunda Modeler Desktop App : 

./bpmn-modeler/camunda-modeler
