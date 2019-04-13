# camunda-survey


##  Installing it


### Installing the engine

Just execute : 

```bash
export URI_DE_CE_REPO=https://github.com/Jean-Baptiste-Lasselle/camunda-survey
mkdir -p ./camunda-survey/ 
cd ./camunda-survey/ 
git clone $URI_DE_CE_REPO ./
chmod +x ./operations.sh
 ./operations.sh
```
* The camunda bpmn engine is installed and started on `http://whatever-yourhost-is:8091/camunda/` : use `demo` / `demo` as useranme and password.
* With the `Camunda Modeler`, you'll be able to create a task, and deploy it to the camunda bpmn engine

### Installing the Camunda Modeler

The Camunda Modeler is a Desktop ELectronJS App, and you can install it on your machine with : 

```bash
export CAMUNDA_WEB_MODELER_VERSION=3.0.1
export CAMUNDA_WEB_MODELER_DOWNLOAD_URI="https://camunda.org/release/camunda-modeler/$CAMUNDA_WEB_MODELER_VERSION/camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64.tar.gz"

curl -o ~/camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64.tar.gz -L $CAMUNDA_WEB_MODELER_DOWNLOAD_URI
mkdir ~/.camunda/
tar -xvf ~/camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64.tar.gz -C ~/.camunda/
# Then run it with : 
~/.camunda/camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64/camunda-modeler
# e.g.: ~/.camunda/camunda-modeler-3.0.1-linux-x64/camunda-modeler
# Or :
echo "export PATH=\"$PATH:~/.camunda/camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64/camunda-modeler\"" >> ~/.bashrc
```


* Then suddenly, an `ElectronJS` Application will fire up, the `Camunda BPMN Modeler`

##  Create A task

Just GUI clicks n' drops at http://poste-devops-typique:8091/camunda



## Implement the task in NodeJS

https://docs.camunda.org/get-started/quick-start/service-task/

* Un des points d'intégration est le nom donné à la tâche : 
```bash
export CONDUITE_IO_TASK_NAME=ccc
```
* qui est repris par le paramètre `topic`, que l'on configure dans le fichier `bpmn 2.0` : 

![param intégration impl taches bpmn](https://github.com/Jean-Baptiste-Lasselle/camunda-survey/raw/master/documentation/images/CAMUNDA_BPMN_TASK_IMPLEMENTATION_TOUS_LES_PARAMETRES_INTEGRATION_2019-04-13%2007-10-13.png)

On remarquera enfin l'intégration à l'infrastructure avec le nom d'hôte et le numéro de port, qui sont aussi configurables par les variables d'environnement suivantes : 

```bash

# 
# La valeur de CONDUITE_IO_TASK_NAME doit correspondre à celle vue dans
# le screenshot ci-dessus, pour le paramètre `topic`, que l'on
# configure dans le fichier `bpmn 2.0`
# 
export CONDUITE_IO_TASK_NAME=preparation-sandwich-operation-ninja
export POLLING_HOST=poste-devops-typique

# 
# cf. [./operations.sh] export NUM_PORT_ECOUTE_CAMUNDA_ENGINE=8091
# cf. [./.env] NUM_PORT_ECOUTE_CAMUNDA_ENGINE=NUM_PORT_ECOUTE_CAMUNDA_ENGINE_JINJA2_VAR
# 
export NUM_PORT_ECOUTE_CAMUNDA_ENGINE=8093
export POLLING_PORT=$NUM_PORT_ECOUTE_CAMUNDA_ENGINE
echo "Now You may execute the regular provisioning reicpe"
```

## Deploy and run the task

# RESTE PLUS QUE ça

https://github.com/Jean-Baptiste-Lasselle/camunda-survey/issues/3

# ANNEXES 

## SOURCES Camunda

https://github.com/camunda/docker-camunda-bpm-platform

