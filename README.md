# UCO-Shacle-Validator-Docker
* A SHACL Validator customized for UCO Ontology validation
```
If [ you are looking for such a requirement as a Container ]:
   Then [ this one may be for you ]
```
# UCO Version
* UCO-1.1.0

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
  * Validate as: choose [ Core UCO ], or [ Full UCO ]
  * Content syntax choose [JSON-LD] (for the above device.json)

 * File Base Validation:
   * Content to validatet: choose [ File ] and click "Select File" to provide local JSON-LD file 
   * Validate as: choose [ Core UCO ], or [ Full UCO ]
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

# Resources
* [UCO Ontology](https://github.com/ucoProject/UCO)
* [CASE Onotlogy](https://github.com/casework)
* [Casework Examples Github](https://github.com/casework/CASE-Examples)

