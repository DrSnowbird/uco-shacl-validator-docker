#!/bin/bash -x

curl -L -X POST "http://0.0.0.0:8080/shacl/UCO/api/validate" -H "Accept: application/json" -H "Content-Type: application/json" --data-raw "{
    \"validationType\": \"large\",
    \"embeddingMethod\": \"URL\",
    \"contentToValidate\": \"https://raw.githubusercontent.com/casework/CASE-Examples/master/examples/illustrations/device/device.json\",
    \"contentSyntax\": \"application/ld+json\",
    \"reportSyntax\": \"application/ld+json\"
}"
