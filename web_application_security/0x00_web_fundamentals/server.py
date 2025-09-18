#!/usr/bin/env python3
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlparse, parse_qs

class H(BaseHTTPRequestHandler):
    def log_request_info(self, body=b''):
        print("----REQUEST----")
        print(self.command, self.path)
        for k,v in self.headers.items():
            print(f"{k}: {v}")
        if body:
            print("BODY:", body.decode(errors='replace'))
        # parse and print query params
        qs = urlparse(self.path).query
        if qs:
            print("QUERY:", parse_qs(qs))
        print("---------------")

    def do_GET(self):
        length = int(self.headers.get('Content-Length', 0) or 0)
        body = self.rfile.read(length) if length else b''
        self.log_request_info(body)
        self.send_response(200)
        self.send_header("Content-Type","text/plain")
        self.end_headers()
        self.wfile.write(b'OK')

    def do_POST(self):
        length = int(self.headers.get('Content-Length', 0) or 0)
        body = self.rfile.read(length) if length else b''
        self.log_request_info(body)
        self.send_response(200)
        self.send_header("Content-Type","text/plain")
        self.end_headers()
        self.wfile.write(b'OK')

if __name__ == '__main__':
    HTTPServer(('', 80), H).serve_forever()

