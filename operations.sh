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

# The CAmunda Task Worker :
# -->> will register to the Camunda Engine, polling the Camunda API, the Camunda Engine being deployed to a Net Host of name [poste-devops-typique]
# -->> will register be deployed to a Net Host of name [poste-devops-typique]
export POLLING_HOST=poste-devops-typique
export POLLING_PORT=$NUM_PORT_ECOUTE_CAMUNDA_ENGINE
export CONDUITE_IO_TASK_NAME=preparer-les-sandwich
export NUM_PORT_ECOUTE_PEGASUS_TASK_IN_CONTAINER=3000

#
# echo "[POLLING_HOST=$POLLING_HOST]"
# echo "[POLLING_PORT=$POLLING_PORT]"
#

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

# Camunda Modeler Desktop `ElectronJS` App
sed -i "s#CAMUNDA_WEB_MODELER_OPTIONS_JINJA2_VAR#$CAMUNDA_WEB_MODELER_OPTIONS#g" ./.env

# Camunda Task Implementation Worker
sed -i "s#POLLING_HOST_JINJA2_VAR#$POLLING_HOST#g" ./.env
sed -i "s#POLLING_PORT_JINJA2_VAR#$POLLING_PORT#g" ./.env
sed -i "s#CONDUITE_IO_TASK_NAME_JINJA2_VAR#$CONDUITE_IO_TASK_NAME#g" ./.env

#
#    Fichiers interpolés secondaires :
# => Il s'agit des fichiers qui utilisent des variables qui ne peuvent être interpolées par l'environnement docker.
#
sed -i "s#NOM_DU_RESEAU_DEMO_CAMUNDA_JINJA2_VAR#$NOM_DU_RESEAU_DEMO_CAMUNDA#g" ./docker-compose.yml
sed -i "s#NOM_DU_RESEAU_DEMO_CAMUNDA_JINJA2_VAR#$NOM_DU_RESEAU_DEMO_CAMUNDA#g" ./.env

mkdir -p ./bpmn-modeler/

docker-compose down --rmi all && docker system prune -f && docker-compose up -d

# Now we should be able to start the task execution with A Camunda Engine REST API call
export CHARGE_DE_TRAVAIL_JSON='{"variables": {"amount": {"value":555,"type":"long"}, "item": {"value":"Achat CAsque Oculus Rift FNC"} } }' ;

startImplementedTask () {
  curl -H "Content-Type: application/json" -X POST -d $CHARGE_DE_TRAVAIL_JSON "http://$POLLING_HOST:$POLLING_PORT/engine-rest/process-definition/key/$CONDUITE_IO_TASK_NAME/start"
}

echo " Now all you have to do, is to use the Camunda Modeler to create a BPMN Process Definition , of ServiceTask Type, with connector external and [topic] ["$CONDUITE_IO_TASK_NAME"]  "
