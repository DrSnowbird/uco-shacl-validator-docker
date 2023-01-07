#!/bin/bash -x

# ref
#   github: https://github.com/ISAITB/shacl-validator
#   Jar (all-in-one): https://www.itb.ec.europa.eu/shacl-jar/any/validator.zip
#   - Via Docker, using the isaitb/shacl-validator image from the Docker Hub.
#   - Via JAR file, using the generic web application package.
#   - Via command line tool, using the generic command line tool package.
# Proxy (Nginx) Setup
#   - https://www.itb.ec.europa.eu/docs/guides/latest/installingValidatorProduction/index.html#guide-installingvalidatorproduction-steps-operate-docker
# Validator Configuration
#   - https://www.itb.ec.europa.eu/docs/guides/latest/validatingRDF/index.html#step-3-prepare-validator-configuration
#   - https://www.itb.ec.europa.eu/docs/guides/latest/validatingRDF/index.html#validator-configuration-properties

#docker run -d --name my-validator -p 58088:8080 \
# ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/validator/validator.jar"]
# java,"-Djava.security.egd=file:/dev/./urandom","-jar","/validator/validator.jar"]
#
# Generic validator: 
# It is possible to not predefine any SHACL shapes resulting in a validator that is truly generic, 
# expecting all shapes to be provided by users. 
# Such a generic instance actually exists at https://www.itb.ec.europa.eu/shacl/any/upload.
# Eurpoa.eu Validator online service:
#   - https://joinup.ec.europa.eu/collection/interoperability-test-bed-repository/solution/interoperability-test-bed/news/shacl-shape-validation-your-own-language

# REST-API
#    Swagger-UI: https://www.itb.ec.europa.eu/shacl/swagger-ui/index.html
#
# e.g.
#   https://www.itb.ec.europa.eu/docs/guides/latest/validatingRDF/
#     validator.type = v2.2.1
#     ...
#     validator.shaclFile.v2.2.1.remote.0.url = https://my.server.com/my_rules_1.ttl
#     validator.shaclFile.v2.2.1.remote.0.type = text/turtle
#     validator.shaclFile.v2.2.1.remote.1.url = https://my.server.com/my_rules_2.rdf
#     validator.shaclFile.v2.2.1.remote.1.type = application/rdf+xml

# - https://www.itb.ec.europa.eu/docs/guides/latest/installingValidatorProduction/index.html#guide-installingvalidatorproduction-steps-operate-docker
VALIDATOR_HOME=${VALIDATOR_HOME:-/home/developer/app/validator}
java -Dvalidator.resourceRoot=${VALIDATOR_HOME}/resources \
     -Dlogging.file.path=${VALIDATOR_HOME}/logs \
     -Dvalidator.tmpFolder=${VALIDATOR_HOME}/tmp \
     -jar ${VALIDATOR_HOME}/validator.jar
     

