#!/bin/bash

set -ex

TARGET_GROUP_ARN=$(yq '.yelbEcsLbTargetGroup1Arn' ${YTT}/output/cfn-stack-exports.yaml)

ytt -f "${YTT}/templates/" \
    --data-value cluster.name1="${USECASE1_CLUSTER}" \
    --data-value-yaml cluster.name2="${USECASE1_CLUSTER}" \
    --data-value-yaml cluster.namespace1="${USECASE1_NS}" \
    --data-value-yaml cluster.namespace2="${USECASE1_NS}" \
    --data-value-yaml elbv2.TargetGroupArn1="${TARGET_GROUP_ARN}" \
    --output-files "${YTT}/output/usecase1/"
