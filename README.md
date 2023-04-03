# SHACL-based RDF Graph Validator Docker
* A SHACL Validator customized for [UCO](https://github.com/ucoProject/UCO) Ontology validation as the default configuration.
* `Important!` This SHACL validator is actually generic for `any` SHACL ontology (use Web UI to change) -- it is not specific to UCO though the default configurations including a few of UCO ontology family (including extensions from [UCO](https://github.com/ucoProject/UCO) ontology)
```
If [ you are looking for such a requirement as a Container ]:
   Then [ this one may be for you ]
```

# SHACL Shapes Ontology Configured
* You can modify the configurations to add (or remove) your local domain specific SHACL ontologies to change the default.
* Whenver you update the configuration file, you need to `restart` the docker services (using `make down` and `make up`)
1. [UCO](https://github.com/ucoProject/UCO) (v1.2.0 as latest)
2. [CASE Ontology](https://github.com/casework/CASE) (v1.2.0 as latest)
3. [Adversary Engagement Ontology (University of New Heaven)](https://github.com/UNHSAILLab/Adversary-Engagement-Ontology) (version using latest in github)

# Built & Run with Dependent Docker
1. Build [DrSnowbird/python-nonroot-docker](https://github.com/DrSnowbird/python-nonroot-docker)
    ```
    mkdir -p ~/shacl-project
    cd ~/shacl-project
    git clone https://github.com/DrSnowbird/python-nonroot-docker
    cd python-nonroot-docker
    make build
    ```
2. Build & Run [DrSnwobird/uco-shacl-validator-docker](https://github.com/DrSnowbird/uco-shacl-validator-docker) 
* Assuming you want to use default configuration to run.
    ```
    mkdir -p ~/shacl-project
    cd ~/shacl-project
    git clone https://github.com/DrSnowbird/uco-shacl-validator-docker
    cd uco-shacl-validator-docker
    make build
    make up
    ```

# Run (recommended for easy-start)
* If you follow the above default build and run, you can ignore this step.
* Simply, (if you modify configuration)
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
  * Validate as: choose `case` from the dropdown list [ uco, case, ae, uco-all ]
  * Content syntax choose [JSON-LD] (for the above device.json)

 * File Base Validation:
   * Content to validatet: choose [ File ] and click "Select File" to provide local JSON-LD file 
   * Validate as: choose `case` from the dropdown list [ uco, case, ae, uco-all ]
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

# SHACL Validator Upstream Artifacts
* This project use the artifacts from:
  * [ISAITB ITB commons](https://github.com/ISAITB/itb-commons)
  * [ISAITB shacl-validator](https://github.com/ISAITB/shacl-validator)
  
# Ontology Resources
* [UCO Ontology](https://github.com/ucoProject/UCO)
* [Adversary Engagement Ontology Foundation by University of New Heaven](https://adversaryengagementontology.org/)
* [Adversary Engagement Ontology (University of New Heaven)](https://github.com/UNHSAILLab/Adversary-Engagement-Ontology)
* [CASE Onotlogy](https://github.com/casework)
* [Casework-Examples Github](https://github.com/casework/CASE-Examples)
* [Casework-Examples Illustration](https://github.com/casework/CASE-Examples/tree/master/examples/illustrations)
* [UCO App Docker (SHACL validation + RDF Store + GraphQL (Ultra GraphQL automation)](https://github.com/DrSnowbird/uco-app-docker)
  * Integrated automation as the end-to-end pipeline: (`to be released soon for public access usage!`)
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

   
