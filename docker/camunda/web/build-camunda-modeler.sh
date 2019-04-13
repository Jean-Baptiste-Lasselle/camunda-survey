#!/bin/sh

echo "VERIF [NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER=$NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER]"

# install dev dependencies

npm install --save-dev cross-env
npm install --save-dev webpack
npm install --save-dev webpack-cli
npm audit fix
npm install --save-dev case-sensitive-paths-webpack-plugin
npm audit fix
npm install --save-dev copy-webpack-plugin
npm audit fix
npm install --save-dev license-webpack-plugin

npm install --save-dev babel-loader
npm audit fix
npm install --save-dev @babel/core
npm audit fix
npm install --save-dev @babel/plugin-syntax-dynamic-import
npm audit fix
npm install --save-dev @babel/plugin-proposal-class-properties

npm audit fix


# install dependencies
# plus a few new dev dependencies, due to new transitive resolutions to be automatically resolved, instead of
# finding them one after the other
npm install 

npm run build
cd ./client 
npm start -- --host 0.0.0.0 --port $NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER
