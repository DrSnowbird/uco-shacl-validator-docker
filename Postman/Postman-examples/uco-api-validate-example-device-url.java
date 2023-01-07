Unirest.setTimeouts(0, 0);
HttpResponse<String> response = Unirest.post("http://0.0.0.0:8080/shacl/UCO/api/validate")
  .header("Accept", "application/json")
  .header("Content-Type", "application/json")
  .body("{\n    \"validationType\": \"large\",\n    \"embeddingMethod\": \"URL\",\n    \"contentToValidate\": \"https://raw.githubusercontent.com/casework/CASE-Examples/master/examples/illustrations/device/device.json\",\n    \"contentSyntax\": \"application/ld+json\",\n    \"reportSyntax\": \"application/ld+json\"\n}")
  .asString();

