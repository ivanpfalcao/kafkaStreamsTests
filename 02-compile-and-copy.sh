#!/bin/bash
BASEDIR="$( cd "$( dirname "${0}" )" && pwd )"

echo ${1}
NAMESPACE="kafka"
if [ "$1" != "" ]
then
    NAMESPACE="${1}"
fi

kubectl -n "${NAMESPACE}" exec -it mavenstset-0 -- /bin/bash -c "rm -rf /tmp/kafkaStreamsTests"
kubectl -n "${NAMESPACE}" cp "${BASEDIR}" mavenstset-0:/tmp/kafkaStreamsTests
kubectl -n "${NAMESPACE}" exec -it mavenstset-0 -- /bin/bash -c "cd /tmp/kafkaStreamsTests && mvn clean package"