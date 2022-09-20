#!/bin/bash
BASEDIR="$( cd "$( dirname "${0}" )" && pwd )"

echo ${1}
NAMESPACE="kafka"
if [ "$1" != "" ]
then
    NAMESPACE="${1}"
fi

kubectl -n "${NAMESPACE}" exec -it kafka-helm-0 -- /bin/bash -c "kafka-console-consumer.sh --bootstrap-server kafka-helm-0.kafka-helm-headless.kafka.svc.cluster.local:9092 --topic outputTopic --from-beginning"


