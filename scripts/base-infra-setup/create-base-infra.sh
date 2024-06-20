#!/bin/bash

set -ex

aws --profile "${AWS_PROFILE}" --region "${AWS_DEFAULT_REGION}" \
    cloudformation deploy \
    --stack-name "${ENVIRONMENT_NAME}-base-infra" \
    --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM \
    --template-file "${SPATH}/scripts/base-infra-setup/base-infra-cfn.yaml" \
    --parameter-overrides \
    EnvironmentName="${ENVIRONMENT_NAME}" \
    YelbCloudMapDomain="${USECASE4_INTERNAL_NS}" \
    InternalLBNamespace="${USECASE4_INTERNAL_LB_NS}"
