const { Client, logger } = require('camunda-external-task-client-js');


// A better Env

const POLLING_HOST = process.env.POLLING_HOST || 'localhost';
const POLLING_PORT = process.env.POLLING_PORT || '8085';
const CONDUITE_IO_TASK_NAME = process.env.CONDUITE_IO_TASK_NAME || 'MiseAJourDocuements';




// configuration for the Client:
//  - 'baseUrl': url to the Process Engine
//  - 'logger': utility to automatically log important events
//  - 'asyncResponseTimeout': long polling timeout (then a new request will be issued)
// const config = { baseUrl: 'http://localhost:8080/engine-rest', use: logger, asyncResponseTimeout: 10000 };
const config = { baseUrl: 'http://' + POLLING_HOST + ':' + POLLING_PORT + '/engine-rest', use: logger, asyncResponseTimeout: 10000 };

// create a Client instance with custom configuration
const client = new Client(config);

// susbscribe to the topic: 'charge-card'
client.subscribe(CONDUITE_IO_TASK_NAME, async function({ task, taskService }) {
  // Put your business logic here

  // Get a process variable
  const amount = task.variables.get('amount');
  const item = task.variables.get('item');

  console.log(`Charging credit card with an amount of ${amount}€ for the item '${item}'...`);

  // Complete the task
  await taskService.complete(task);
});

