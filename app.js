const express = require('express');
const app = express();

app.get('/', (req, res) => {
	  res.send('Hello World from Jenkins CI/CD!');
});

module.exports = app;

