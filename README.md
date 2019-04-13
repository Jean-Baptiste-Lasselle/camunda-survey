# camunda-survey


##  Installing it


* Just execute : 

```bash
export URI_DE_CE_REPO=https://github.com/Jean-Baptiste-Lasselle/camunda-survey
mkdir -p ./camunda-survey/ 
cd ./camunda-survey/ 
git clone $URI_DE_CE_REPO ./
chmod +x ./operations.sh
 ./operations.sh
```
* Then suddenly, an `ElectronJS` Application will fire up, the `Camunda BPMN Modeler`
* The camunda bpmn engine is installed and started on `http://whatever-yourhost-is:8091/camunda/` : use `demo` / `demo` as useranme and password.
* With the `Camunda Modeler`, you'll be able to create a task, and deploy it to the camunda bpmn engine

##  Create A task

Just GUI clicks n' drops at http://poste-devops-typique:8091/camunda



## Implement the task in NodeJS

https://docs.camunda.org/get-started/quick-start/service-task/

## Deploy and run the task


# ANNEXES 

## SOURCES Camunda

https://github.com/camunda/docker-camunda-bpm-platform

