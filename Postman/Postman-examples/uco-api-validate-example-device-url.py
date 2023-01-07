import requests
import json

url = "http://0.0.0.0:8080/shacl/UCO/api/validate"

payload = json.dumps({
  "validationType": "large",
  "embeddingMethod": "URL",
  "contentToValidate": "https://raw.githubusercontent.com/casework/CASE-Examples/master/examples/illustrations/device/device.json",
  "contentSyntax": "application/ld+json",
  "reportSyntax": "application/ld+json"
})
headers = {
  'Accept': 'application/json',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

