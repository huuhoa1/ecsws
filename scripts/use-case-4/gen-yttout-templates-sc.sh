#!/bin/bash

set -ex

TARGET_GROUP_ARN=$(yq '.yelbEcsLbTargetGroup4Arn' ${YTT}/output/cfn-stack-exports.yaml)
CLUSTER_NAMESPACE=$(yq '.yelbServiceDiscoveryNameSpaceName' ${YTT}/output/cfn-stack-exports.yaml)

ytt -f "${YTT}/templates/" \
     -f ${YTT}/overlay/svc-update-remove-fields.yml \
    --data-value-yaml cluster.name1="${USECASE4_CLUSTER}" \
    --data-value-yaml cluster.name2="${USECASE4_CLUSTER}" \
    --data-value-yaml cluster.namespace1="${USECASE4_NS}" \
    --data-value-yaml cluster.namespace2="${USECASE4_NS}" \
    --data-value-yaml elbv2.TargetGroupArn1="${TARGET_GROUP_ARN}" \
    --data-value-yaml cluster.serviceConnectConfigurationEnabled=true \
    --output-files "${YTT}/output/usecase4/"
