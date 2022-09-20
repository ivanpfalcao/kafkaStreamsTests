#!/bin/bash
BASEDIR="$( cd "$( dirname "${0}" )" && pwd )"

echo ${1}
NAMESPACE="kafka"
if [ "$1" != "" ]
then
    NAMESPACE="${1}"
fi

kubectl create namespace "${NAMESPACE}"
kubectl -n "${NAMESPACE}" apply -f "${BASEDIR}/kafka-stream-stset.yaml"
