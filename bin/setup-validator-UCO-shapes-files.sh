#!/bin/bash 

cd $(dirname $0)/..
PROJ_DIR=$(realpath ${0%/*}/..)

echo -e ">>> PROJ_DIR=${PROJ_DIR}"

VALIDATOR_RESOURCES=${PROJ_DIR}/validator/resources
VALIDATOR_RESOURCES_CONFIG=${PROJ_DIR}/validator/resources/UCO/config.properties

UCO_RESOURCE_DIR=${VALIDATOR_RESOURCES}/UCO
UCO_SHAPES_DIR=${UCO_RESOURCE_DIR}/shapes

WORK_DIR=${PROJ_DIR}/uco

UCO_LATEST_VERSION="`curl --silent https://api.github.com/repos/ucoProject/UCO/releases/latest | jq -r .tag_name | sed 's/^v//' `"
UCO_VERSION=${UCO_VERSION:-$UCO_LATEST_VERSION}
UCO_DIR=${WORK_DIR}/UCO-${UCO_VERSION}
UCO_HOME=${WORK_DIR}/UCO

function download_UCO() {
    if [ ! -s ${WORK_DIR} ]; then
        mkdir -p ${WORK_DIR}
    fi
    cd ${WORK_DIR}
    ZIP_URL=https://github.com/ucoProject/UCO/archive/refs/tags/${UCO_VERSION}.zip
    wget --no-check-certificate ${ZIP_URL}
    if [ ! -s ${UCO_VERSION}.zip ]; then
        echo ">>> ERROR: download ${UCO_VERSION}.zip : failed! Abort"
        exit 1
    else
        ls -al *.zip
        unzip ${UCO_VERSION}.zip
    
        if [ ! -s ${UCO_DIR} ]; then
            echo -e ">>> ERROR: ${UCO_DIR}: UCO folder not found after download and unzip"
            exit 1
        else
            echo -e ">>> OK: ${UCO_DIR}"
            if [ -s ${UCO_HOME} ]; then 
                rm -f ${UCO_HOME}
            fi
            ln -s ${UCO_DIR} ${UCO_HOME}
            ls -al ${UCO_HOME}
        fi
    fi
    cd ${PROJ_DIR}    
} 

if [ ! -s ${UCO_DIR} ]; then
    ## -- need to download UCO specific version: --
    download_UCO
else
    ls -al ${UCO_DIR}
    ls -al ${UCO_HOME}
fi


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
TTL_FILES=$(find ${UCO_DIR}/ontology -name "*.ttl")
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
validator.uploadTitle = UCO SHACL-based RDF Graph Validator (${UCO_VERSION})

validator.type = uco,case,ae,uco_all
# Labels to describe the defined types.

validator.typeLabel.uco = uco
validator.typeLabel.case = case
validator.typeLabel.ae = ae
validator.typeLabel.uco_all = uco_all

# Validation artefacts (SHACL shapes) to consider for the "uco" type.
validator.shaclFile.uco = ${SHAPES_LIST}

# -- Validation artefacts (SHACL shapes) to consider for the "case" type.
validator.shaclFile.case = ${SHAPES_LIST},shapes/case-unstable.ttl

# -- Validation artefacts (SHACL shapes) to consider for the "ae" type.
validator.shaclFile.ae = ${SHAPES_LIST},shapes/ae_ontology.ttl

# -- Validation artefacts (SHACL shapes) to consider for the "uco_all" type.
validator.shaclFile.uco_all = ${SHAPES_LIST},shapes/case-unstable.ttl,shapes/ae_ontology.ttl


EOF
}
generate_validator_resource_config
cat ${VALIDATOR_RESOURCES_CONFIG}
