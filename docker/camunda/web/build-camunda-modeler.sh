#!/bin/sh

echo "VERIF [NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER=$NUM_PORT_ECOUTE_CAMUNDA_WEB_IN_CONTAINER]"

# install dev dependencies
# npm audit fix
npm install --save-dev cross-env
npm install --save-dev webpack
npm install --save-dev webpack-cli
npm install --save-dev case-sensitive-paths-webpack-plugin
npm install --save-dev copy-webpack-plugin
npm install --save-dev license-webpack-plugin
npm install --save-dev babel-loader
npm install --save-dev @babel/core
npm install --save-dev @babel/plugin-syntax-dynamic-import
npm install --save-dev @babel/plugin-proposal-class-properties
npm install --save-dev @babel/preset-env
npm install --save-dev @babel/preset-react

# install run dependencies
npm install --save @bpmn-io/add-exporter @bpmn-io/align-to-origin @bpmn-io/replace-ids 
# npm install --save bpmn-js-properties-panel bpmn-js-signavio-compat 
# re-resolve saved dependencies
# plus a few new dev dependencies, due to new transitive resolutions to be automatically resolved, instead of
# finding them one after the other
npm install 
# npm audit fix

npm run build
