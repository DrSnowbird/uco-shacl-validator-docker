#!/bin/bash

if [ $# -lt 1 ]; then
    echo 
    echo -e ">>> Usage:"
    echo -e ">>> $0 <bug fix branch, e.g., Bug-Fix-513>"
    echo -e ">>> e.g."
    echo -e ">>> $0 Bug-Fix-513"
    echo
    exit 0
fi

cd $(dirname $0)/..
PROJ_DIR=$(realpath ${0%/*}/..)

echo -e ">>> PROJ_DIR=${PROJ_DIR}"

#GIT_BRANCH=${1:-Bug-Fix-513}
GIT_BRANCH=${1:-master}

VALIDATOR_RESOURCES=${PROJ_DIR}/validator/resources
VALIDATOR_RESOURCES_CONFIG=${PROJ_DIR}/validator/resources/UCO/config.properties

UCO_RESOURCE_DIR=${VALIDATOR_RESOURCES}/UCO
UCO_SHAPES_DIR=${UCO_RESOURCE_DIR}/shapes

WORK_DIR=${PROJ_DIR}/uco

UCO_LATEST_VERSION="`curl --silent https://api.github.com/repos/ucoProject/UCO/releases/latest | jq -r .tag_name | sed 's/^v//' `"
UCO_VERSION=${UCO_VERSION:-$UCO_LATEST_VERSION}
#UCO_DIR=${WORK_DIR}/UCO-${UCO_VERSION}
UCO_HOME=${WORK_DIR}/UCO

function clone_UCO() {
    if [ ! -s ${WORK_DIR} ]; then
        mkdir -p ${WORK_DIR}
    fi
    cd ${WORK_DIR}
    
    if [ ! -s ${UCO_HOME} ]; then
        GIT_URL=https://github.com/ucoProject/UCO.git
        git clone ${GIT_URL} ${UCO_HOME}
        echo -e ">>>>>>>>>> current dir: $PWD"
        cd ${UCO_HOME}
        git switch ${GIT_BRANCH}
    fi

    if [ ! -s ${UCO_HOME} ]; then
        echo -e ">>> ERROR: ${UCO_HOME}: UCO folder not found after git clone! Abort!"
        exit 1
    else
        echo -e ">>> OK: ${UCO_HOME}"
        ls -al ${UCO_HOME}
    fi

    cd ${PROJ_DIR}    
} 

clone_UCO


#if [ ! -s ${UCO_DIR} ]; then
#    ## -- need to download UCO specific version: --
#    download_UCO
#else
#    ls -al ${UCO_DIR}
#    ls -al ${UCO_HOME}
#fi


## -- copy *.ttl to validator/resources/UCO-1.1.0 folder: -
## -- cp -r validator/resources/UCO-1.1.0 validator/resources/UCO
if [ -s ${UCO_RESOURCE_DIR} ]; then
    # backup existing resources/UCO dir:
    mkdir -p ${PROJ_DIR}/SAVE
    mv ${UCO_RESOURCE_DIR} ${PROJ_DIR}/SAVE/resources_$(basename ${UCO_RESOURCE_DIR})_$(date +"%Y-%m-%d-%H-%M-%S")
    if [ -s ${VALIDATOR_RESOURCES_CONFIG} ]; then
        mv ${VALIDATOR_RESOURCES_CONFIG} ${PROJ_DIR}/SAVE/resources_$(basename ${VALIDATOR_RESOURCES_CONFIG})_$(date +"%Y-%m-%d-%H-%M-%S")
    fi
fi
if [ ! -s ${UCO_SHAPES_DIR} ]; then
    mkdir -p ${UCO_SHAPES_DIR}
fi

## -- find all *.ttl files: --
TTL_FILES=$(find ${UCO_HOME}/ontology -name "*.ttl")
SHAPES_LIST=""
for ttl in $TTL_FILES; do
    cp $ttl ${UCO_SHAPES_DIR}/
    if [ "${SHAPES_LIST}" == "" ]; then
        SHAPES_LIST=shapes/$(basename ${ttl})
    else
        SHAPES_LIST="${SHAPES_LIST},shapes/$(basename ${ttl})"
    fi
done
ls -al ${UCO_SHAPES_DIR}

echo -e ">>> SHAPES_LIST=${SHAPES_LIST}"

## -- create validator/resources/config.properties using config.properties.template --

#########################################################################
#### ---- Customization for multiple virtual python environment ---- ####
####      (most recommended approach and simple to switch venv)      ####
#########################################################################
function generate_validator_resource_config() {
cat << EOF >> ${VALIDATOR_RESOURCES_CONFIG}
# The different types of validation to support. These values are reflected in other properties.
# ref: https://www.itb.ec.europa.eu/docs/guides/latest/validatingRDF/index.html#guide-validatingrdf-references-validator-props

# The title to display for the validator's user interface.
validator.uploadTitle = UCO SHACL-based RDF Graph Validator

validator.type = core, full
# Labels to describe the defined types.

validator.typeLabel.core = Core UCO
validator.typeLabel.full = Full UCO

# Validation artefacts (SHACL shapes) to consider for the "core" type.
validator.shaclFile.core = shapes/co.ttl,shapes/owl.ttl,shapes/core.ttl

# Validation artefacts (SHACL shapes) to consider for the "full" type.
#validator.shaclFile.full = shapes/PurchaseOrder-common-shapes.ttl, shapes/PurchaseOrder-large-shapes.ttl
validator.shaclFile.full = ${SHAPES_LIST}
EOF
}
generate_validator_resource_config
cat ${VALIDATOR_RESOURCES_CONFIG}
