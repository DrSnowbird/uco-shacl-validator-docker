ARG BASE=${BASE:-openkbs/java-nonroot-docker}
#ARG BASE=${BASE:-openkbs/jdk11-mvn-py3}
FROM ${BASE}

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

#########################
#### ---- App:  ---- ####
#########################
USER ${USER:-developer}
WORKDIR ${HOME:-/home/developer}

ENV APP_HOME=${APP_HOME:-$HOME/app}
ENV APP_MAIN=${APP_MAIN:-setup.sh}

#########################
#### ---- App:  ---- ####
#########################
COPY --chown=$USER:$USER ./app $HOME/app

#########################################
##### ---- Setup: Entry Files  ---- #####
#########################################
COPY --chown=${USER}:${USER} docker-entrypoint.sh /
COPY --chown=${USER}:${USER} ${APP_MAIN} ${APP_HOME}/setup.sh
RUN sudo chown -R ${USER}:${USER} ${APP_HOME} && \
    sudo chmod +x /docker-entrypoint.sh ${APP_HOME}/setup.sh 

#####################################
##### ---- APP: download   ---- #####
#####################################
COPY --chown=${USER}:${USER} validator ${APP_HOME}/validator
COPY --chown=${USER}:${USER} scripts/run-validator-as-java-inside-docker.sh ${APP_HOME}/run-validator-as-java-inside-docker.sh
ARG VALIDATOR_ZIP_URL=${VALIDATOR_ZIP:-https://www.itb.ec.europa.eu/shacl-jar/any/validator.zip}
RUN VALIDATOR_ZIP=$(basename ${VALIDATOR_ZIP_URL}) && wget -q ${VALIDATOR_ZIP_URL} && cp validator.zip ${APP_HOME}/validator/ && \
    unzip ${VALIDATOR_ZIP} && cp validator.jar ${APP_HOME}/validator/validator.jar && ls -al  && \
    find ${APP_HOME}

############################################
##### ---- APP: download (Local)  ---- #####
############################################
##
## (use the lines below instead of the above when the remote site is not available!)
##
#COPY --chown=${USER}:${USER} validator ${APP_HOME}/validator
#COPY --chown=${USER}:${USER} scripts/run-validator-as-java-inside-docker.sh ${APP_HOME}/run-validator-as-java-inside-docker.sh
#COPY --chown=${USER}:${USER} jar ${APP_HOME}/validator/validator.jar && ls -al && find ${APP_HOME}

#########################################
##### ---- Docker Entrypoint : ---- #####
#########################################
WORKDIR ${APP_HOME}
USER ${USER}
ENTRYPOINT ["/docker-entrypoint.sh"]

# && rm -f ${VALIDATOR_ZIP} && \
# 

#RUN VALIDATOR_SRC_TAR_GZ=https://github.com`curl -s https://github.com/ISAITB/shacl-validator/releases |grep "tar.gz" | head -1 | cut -d'"' -f2` &&
#    wget ${VALIDATOR_SRC_TAR_GZ} && tar xvf $(basename ${VALIDATOR_SRC_TAR_GZ})

######################
#### (Test only) #####
######################
#CMD ["/bin/bash"]
######################
#### (RUN setup) #####
######################
#CMD ["setup.sh"]
#CMD ["/bin/bash", "${APP_HOME}/run-validator-as-java-inside-docker.sh"]
CMD ["./run-validator-as-java-inside-docker.sh"]
