# camunda-survey

# TODO du mataîng

documentation/images/use-case-complet/versioning-processus/ : il faut faire la paragraphe avec illustrations, pour
le versionning `Are you _Business As Code_? (_B.A.A.C._, _"BPMN / Business Addressed As Code"_)`

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
* If you execute `docker logs -f `, and the Camunda Implementation is in Good Health, you should have an output that looks like that :
```bash
# > ~/camunda-survey
# $ docker logs -f camunda-survey_camunda_task_worker_1
polling
✓ subscribed to topic preparer-les-sandwich
polling
✓ polled 0 tasks
polling
✓ polled 0 tasks
polling
✓ polled 0 tasks
polling

```

* With the `Camunda Modeler`, you'll be able to create a task, and deploy it to the camunda bpmn engine

* This might be a convenient copy-paste shortcut :

```bash
docker-compose down --rmi all && docker system prune -f && cd ../ && rm -fr ./camunda-survey/
```

### Installing the Camunda Modeler

The Camunda Modeler is a Desktop ELectronJS App, and you can install it on your machine with :

* Veuillez exécuter :

```bash
export CAMUNDA_WEB_MODELER_VERSION=3.0.1
export CAMUNDA_WEB_MODELER_DOWNLOAD_URI="https://camunda.org/release/camunda-modeler/$CAMUNDA_WEB_MODELER_VERSION/camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64.tar.gz"

curl -o ~/camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64.tar.gz -L $CAMUNDA_WEB_MODELER_DOWNLOAD_URI
mkdir ~/.camunda/
tar -xvf ~/camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64.tar.gz -C ~/.camunda/
# e.g.: ~/.camunda/camunda-modeler-3.0.1-linux-x64/camunda-modeler
# Or :
echo "export PATH=\"\$PATH:~/.camunda/camunda-modeler-$CAMUNDA_WEB_MODELER_VERSION-linux-x64/\"" >> ~/.bashrc
exit

```

* Une fois ces instructions exécutées, la fenêtre de shelle s'est refermée :
  * Ouvrez un dossier, avec l'explorateur graphqiue de l'OS (Le `File Manger`, symbolisé par une armoire de bureau, sur nos postes standards `Debian`)
  * Naviguez là où vous souhaitez pour créer un répertoire, dans lequel vous enregistrerez vos fichiers `BPMN`
  * Cliquez-droit dans la fenêtre du répertoire, et sélectionnez le menu `Open in Terminal`
  * Veuillez maintenant taper au clavier les 3 lettres `cam`, puis pressez la touche `Tabulation`
  * Then suddenly, an `ElectronJS` Application will fire up, the `Camunda BPMN Modeler`
  * Pour terminer, cliquez [sur ce lien](https://www.youtube.com/watch?v=3wZ_b_uUAdQ)
* L'administration vous fournira l'url du serveur pour le déploiement, et vous serez authentifié autpomatiquement avec votre `SSO`




##  Create A task

Just GUI clicks n' drops at http://poste-devops-typique:8091/camunda



## Implement the task in NodeJS

https://docs.camunda.org/get-started/quick-start/service-task/

* Un des points d'intégration est le nom donné à la tâche :
```bash
export CONDUITE_IO_TASK_NAME=tache-pegasus
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
# export CONDUITE_IO_TASK_NAME=preparation-sandwich-operation-ninja
export CONDUITE_IO_TASK_NAME=tache-pegasus
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

Use the camunda modeler, to deploy the process defintion :
* with any name you want, it won't change anything whaen you click deploy.
* Leave the `Business Key` field empty, it's not time to discuss that, same thing when you'll cross raods with some so-called `tenant-ID`
* All you have to let the Camunda Modeler know about, is how to reach the Camunda Engine REST API Endpoint, which will be available at the following `URL` :
```bash
http://$POLLING_HOST:$POLLING_PORT/engine-rest
```

Where `$POLLING_HOST` and `$POLLING_PORT` respectively are net hostname and tcp port number on which the Camunda Engine REST API endpoint is listening.

In a prodcution mode, it might be a good idea, that will make sense to your secops, to configure regular Camunda Engine WebApp and Camunda API Endpoint to use different network interfaces on the host system. An event better optiosn would be to be able to deploy REST API and webclient as two separate applications. We'll find that out later on.  


_**Apparte : Les `Business Keys` BPMN**_

Le Camunda Modeler vous propose de paramétrer une chose apellée `business key`. Cette `business key` correspond exactement à la notion d'`Objet Pivot`, dans la vision de Porter (Harvard Business School), de l'entreprise étendue. Décrite rapidemet, cette notion permet d'échanger des données, d'un processus qui s'exécute, à un autre.

https://blog.camunda.com/post/2018/10/business-key/

# My Conclusions

* With Camunda Engine and Camunda Modeler, We have enough to get a complete workflow working wih BPMN, and that flow is automation-compatible (we'll be able to automate the process).
* Jobs / Run orchestration, and transactional / accountability,  are completely different matters.
* So I'll first just rip off Any Run Orchestration features of Camunda Engine.  I'll only care about :
  * its ability to execute a given process,
  * its ability to be a reference, for the actual processes use at a given moment, in an organisation. Inluding BPMN buuilt-in versioning, that will have to be `ARE YOU BPMN as Code` (Synchronized with a finer, and compatible versioning, on a git repo, the BPMN version tags, being matched to the git repo `RELEASE tags`)
  * its ability to provide Process Execution Accountability, on which relies Business Activity Monitoring pattern.

It might be a good thing to try an alternative to camunda engine, that is :
* https://github.com/catify/bpmn-engine
* because it's based on akka.io, and well, we'll have fun with scaling out,
* And finally because I might end up where I won't be happy with Camunda Process Execution Accountability, so... might instaed use Kafka and some database on the stream way (Thank u F. Ramière..)
* Btw, Camunda is turning on heels, with zeebe.io, it feels like they're on the edge of a major turn in future support plans : SO it's time to go and see what they've got, in other boutiques.
* Time to try https://github.com/catify/bpmn-engine , and Dive in different designer minds, to keep ourselves independent from Camunda Designer's. Fresh it up. See the world from a different Mountain.


# ANNEXES

## Build from SOURCES Camunda

* code source : https://github.com/camunda/docker-camunda-bpm-platform
* Pour faire le build form source :
  * j'ai commencé les travaux,
  * J'ai encore des erreurs, mais il s'agit essentiellement d'un build webpack,
  * je suis arrivé à résoudre les dépendances en dépilant les erreurs, dsn un katacoda
  * et Voilà où j'en suis :


```bash
cd builds-from-source/camunda/modeler
chmod +x ./operations.sh
 ./operations.sh

```
