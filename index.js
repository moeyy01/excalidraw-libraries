var static = require("node-static");
var file = new static.Server(".");
var PORT = 8080;

console.info(`Running at http://localhost:${PORT}`);

require("http")
  .createServer(function (request, response) {
    response.setHeader("Access-Control-Allow-Origin", "*");

    if (request.method === "OPTIONS") {
      response.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
      response.setHeader("Access-Control-Allow-Headers", "Content-Type");
      response.writeHead(200);
      response.end();
      return;
    }

    request
      .addListener("end", function () {
        file.serve(request, response);
      })
      .resume();
  })
  .listen(PORT);
