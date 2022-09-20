#!/bin/bash
BASEDIR="$( cd "$( dirname "${0}" )" && pwd )"

echo ${1}
NAMESPACE="kafka"
if [ "$1" != "" ]
then
    NAMESPACE="${1}"
fi

kubectl create namespace "${NAMESPACE}"
helm repo add bitnami https://charts.bitnami.com/bitnami
helm -n ${NAMESPACE} install kafka-helm -f "${BASEDIR}/parameters.yaml" bitnami/kafka
