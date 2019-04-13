#/bin/bash

export NOM_DU_RESEAU_DEMO_CAMUNDA=reseau_camunda


# Camunda Modeler Desktop EletronJS App


#
# https://github.com/camunda/camunda-modeler
#

export CAMUNDA_WEB_MODELER_GIT_SCM_URI=https://github.com/camunda/camunda-modeler

#
# Must Be a valid Camunda Modeler RELEASE version strictly SEMVER
#
export CAMUNDA_WEB_MODELER_VERSION=3.0.1

#  CAMUNDA_WEB_MODELER_DOWNLOAD_URI
# export CAMUNDA_WEB_MODELER_DOWNLOAD_URI="https://camunda.org/release/camunda-modeler/$CAMUNDA_WEB_MODELER_VERSION/camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64.tar.gz"




#
# echo "[POLLING_HOST=$POLLING_HOST]"
# echo "[POLLING_PORT=$POLLING_PORT]"
#

#
# >>>>>  Interpolation de l'environnement Docker.
#

# Camunda Modeler Desktop EletronJS App

sed -i "s#CAMUNDA_WEB_MODELER_GIT_SCM_URI_JINJA2_VAR#$CAMUNDA_WEB_MODELER_GIT_SCM_URI#g" ./.env
sed -i "s#CAMUNDA_WEB_MODELER_VERSION_JINJA2_VAR#$CAMUNDA_WEB_MODELER_VERSION#g" ./.env
sed -i "s#NOM_DU_RESEAU_DEMO_CAMUNDA_JINJA2_VAR#$NOM_DU_RESEAU_DEMO_CAMUNDA#g" ./.env

#
# Fichiers interpolés secondaires :
# => Il s'agit des fichiers qui utilisent des variables qui ne peuvent être interpolées par l'environnement docker.
#
sed -i "s#NOM_DU_RESEAU_DEMO_CAMUNDA_JINJA2_VAR#$NOM_DU_RESEAU_DEMO_CAMUNDA#g" ./docker-compose.yml


mkdir -p ./bpmn-modeler/

docker-compose down --rmi all && docker system prune -f && docker-compose up -d

# Now we should find Camunda Modeler Desktop App :

ls -allh ./bpmn-modeler/camunda-modeler
