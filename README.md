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

### Installing he Camunda Modeler

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

## Deploy and run the task

# RESTE PLUS QUE ça

https://github.com/Jean-Baptiste-Lasselle/camunda-survey/issues/3

# ANNEXES 

## SOURCES Camunda

https://github.com/camunda/docker-camunda-bpm-platform

