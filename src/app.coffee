http = require 'http'

server = http.createServer (req, res) ->
  res.writeHead 200, {'Content-Type': 'text/plain'}
  res.end 'helloworld!'

server.listen 3001

console.log 'localhost:3001'