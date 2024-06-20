#!/bin/bash

set -ex

TARGET_GROUP_ARN=$(yq '.yelbEcsLbTargetGroup2Arn' ${YTT}/output/cfn-stack-exports.yaml)

ytt -f "${YTT}/templates/" \
    --data-value-yaml cluster.name1="${USECASE2_CLUSTER1}" \
    --data-value-yaml cluster.name2="${USECASE2_CLUSTER2}" \
    --data-value-yaml cluster.namespace1="${USECASE2_NS}" \
    --data-value-yaml cluster.namespace2="${USECASE2_NS}" \
    --data-value-yaml elbv2.TargetGroupArn1="${TARGET_GROUP_ARN}" \
    --output-files "${YTT}/output/usecase2/"

