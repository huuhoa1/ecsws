#!/bin/bash

set -ex

aws --profile "${AWS_PROFILE}" --region "${AWS_DEFAULT_REGION}" \
    cloudformation delete-stack \
    --stack-name "${ENVIRONMENT_NAME}-base-infra" 

aws --profile "${AWS_PROFILE}" --region "${AWS_DEFAULT_REGION}" \
    cloudformation wait stack-delete-complete \
    --stack-name "${ENVIRONMENT_NAME}-base-infra" 
