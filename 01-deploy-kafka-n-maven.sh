#!/bin/bash
BASEDIR="$( cd "$( dirname "${0}" )" && pwd )"

echo ${1}
NAMESPACE="kafka"
if [ "$1" != "" ]
then
    NAMESPACE="${1}"
fi

bash "${BASEDIR}/kafka-helm/create.sh" "${NAMESPACE}"
bash "${BASEDIR}/kafka-stream-stset/deploy-maven-stset.sh" "${NAMESPACE}"
