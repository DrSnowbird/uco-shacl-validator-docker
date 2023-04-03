# UCO or Any SHACL RDF Graph Validator Docker
* A SHACL Validator customized for UCO Ontology validation
```
If [ you are looking for such a requirement as a Container ]:
   Then [ this one may be for you ]
```

# UCO Versions
* UCO v1.2.0
* UCO v1.1.0

# Build
* Due to Docker Hub not allowing free hosting services of pre-built images, you have to make local build to use in your environment
    ```
    make build
    ```

# Run (recommended for easy-start)
* Simply,
    ```
    bin/auto-config-all.sh
    ./run.sh
    ```
* Or, to run as Daemon mode,
    ```
    make up
    ```

# Web-based UI
* Use your Web Browser to go to
  http://0.0.0.0:58088/shacl/UCO/upload
* URI Base Validation:
  * Content to validatet: choose [ URI ] and use the sample URI: [device.json](https://raw.githubusercontent.com/casework/CASE-Examples/master/examples/illustrations/device/device.json) -- right-click and copy-and-paste the entire URL into Validator input field
  * Validate as: choose [ uco, case, ae, uco-all ]
  * Content syntax choose [JSON-LD] (for the above device.json)

 * File Base Validation:
   * Content to validatet: choose [ File ] and click "Select File" to provide local JSON-LD file 
   * Validate as: choose [ uco, case, ae, uco-all ]
   * Content syntax choose [JSON-LD] (for the above device.json) 
 
# Stop Running
* Just `CTRL+C` (if you use ./run.sh), or,
    ```
    ./stop.sh
    or
    make down
    ```

# Quick commands
* Makefile - makefile for build, run, down, etc.
* build.sh - build local image
* logs.sh - see logs of container
* run.sh - run the container
* shell.sh - shell into the container
* stop.sh - stop the container


# Ontology Resources
* [UCO Ontology](https://github.com/ucoProject/UCO)
* [CASE Onotlogy](https://github.com/casework)
* [Casework-Examples Github](https://github.com/casework/CASE-Examples)
* [Casework-Examples Illustration](https://github.com/casework/CASE-Examples/tree/master/examples/illustrations)
* [UCO App Docker (SHACL validation + RDF Store + GraphQL (Ultra GraphQL automation)](https://github.com/DrSnowbird/uco-app-docker)
  * Integrated automation as the end-to-end pipeline:
    * User upload UCO-based ontologies, then
    * This docker will call SHACL-validator REST Service, if the compliance (v1.1.0 as latest) is successful, 
    * Then, the automation will continue to upload / convert the users's RDF/JSON-LD ontologies into RDF Store, i.e., Jena-Fuseki-Docker
    * Then, the automation will continue to automatically feed the just-loaded UCO-compliant ontology to UltraGraphQL-docker to automatically convert input into GraphQL schema,
    * Then, UltraGraphQL-docker will automatically use the auto-generated GraphQL schema to publish the ```live``` GraphQL Web REST API service + Web UI for either users or other client applications to start using 'GraphQL' API to query the user's UCO-compliant ontologies.
    * QED of the entire End-to-End automation!


# RDF + GraphQL Resources
* RDF Stores:
   * [Jena-fuseki-docker](https://github.com/DrSnowbird/jena-fuseki-docker)
   * [RDF4J-docker](https://github.com/DrSnowbird/rdf4j-docker)
* UltraGraphQL:
   * [UltraGraphQL-Upstream](https://git.rwth-aachen.de/i5/ultragraphql)
   * [UltraGraphQL](https://github.com/DrSnowbird/UltraGraphQL)
   * [UltraGraphQL-docker](https://github.com/DrSnowbird/UltraGraphQL-docker)
* HyperGrahQL:
   * [HyperGraphQL-Upstream](https://github.com/hypergraphql/hypergraphql)
   * [HyperGraphQL](https://github.com/DrSnowbird/HyperGraphQL)
   * [HyperGraphQL-docker](https://github.com/DrSnowbird/HyperGraphQL-docker)
   
# Additional Resources
* [Base64 Encode Online](https://www.base64encode.org/)

   
