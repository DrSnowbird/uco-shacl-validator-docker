#!/bin/bash -x

URL_VALIDATOR=http://localhost:8080
curl -X 'GET' \
  "http://0.0.0.0:8080/shacl/UCO/api/info" \
  -H 'accept: application/json'

