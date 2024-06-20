#!/bin/bash

set -ex

TARGET_GROUP_ARN=$(yq '.yelbEcsLbTargetGroup4Arn' ${YTT}/output/cfn-stack-exports.yaml)
CLUSTER_NAMESPACE=$(yq '.yelbServiceDiscoveryNameSpaceName' ${YTT}/output/cfn-stack-exports.yaml)

ytt -f "${YTT}/templates/" \
    --data-value-yaml cluster.name1="${USECASE4_CLUSTER}" \
    --data-value-yaml cluster.name2="${USECASE4_CLUSTER}" \
    --data-value-yaml cluster.namespace1="${CLUSTER_NAMESPACE}" \
    --data-value-yaml cluster.namespace2="${CLUSTER_NAMESPACE}" \
    --data-value-yaml elbv2.TargetGroupArn1="${TARGET_GROUP_ARN}" \
     --data-value-yaml cluster.serviceConnectConfigurationEnabled=false \
    --output-files "${YTT}/output/usecase4/"
