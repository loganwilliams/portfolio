---
title: Serving a little service with node
---

I needed to have an easy way of communicating with the Stanford language parser. I had difficulty using the `stanford-simple-nlp` node package in Meteor directly, and got frustrated with debugging it, so I created another local HTTP server with Node that serves a single endpoint for parsing sentences. And it works!

```
var http = require('http');
var StanfordSimpleNLP = require('stanford-simple-nlp');
var httpdispatcher = require('httpdispatcher');

// listen on port 3xxx
const PORT = 3050; 

var stanfordSimpleNLP = new StanfordSimpleNLP.StanfordSimpleNLP();
var dispatcher = new httpdispatcher();

// load the Stanford Parser. this takes a little while.
stanfordSimpleNLP.loadPipelineSync();

// Lets use our dispatcher
function handleRequest(request, response){
    try {
        //log the request on console
        console.log(request.url);
        //Disptach
        dispatcher.dispatch(request, response);
    } catch(err) {
        console.log(err);
    }
}

// Create an endpoint for parsing a sentence.
dispatcher.onPost("/parse", function(req, res) {
	var text = req.params.text;
	console.log("Request: " + text);

	stanfordSimpleNLP.process(text, function(err, result) {
		if (err) {
			console.log(err);
			res.writeHead(500, {'Content-Type': 'text/plain'});
			res.end();
		} else {
			res.writeHead(200, {'Content-Type': 'text/plain'});
	    	res.end(JSON.stringify(result));
	    }
	});
});

// Create a server and start listening
var server = http.createServer(handleRequest);

server.listen(PORT, function(){
    console.log("Server listening on: http://localhost:%s", PORT);
});
```