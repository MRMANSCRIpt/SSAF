const http = require('http');
const ws = require('ws');

const wss = new ws.Server({noServer: true});

function accept(req, res) {
  if (!req.headers.upgrade || req.headers.upgrade.toLowerCase() != 'websocket') {
    res.end();
    return;
  }

  if (!req.headers.connection.match(/\bupgrade\b/i)) {
    res.end();
    return;
  }

  wss.handleUpgrade(req, req.socket, Buffer.alloc(0), onConnect);
}

if (!module.parent) {
  http.createServer(accept).listen(8080);
} else {
  exports.accept = accept;
}
