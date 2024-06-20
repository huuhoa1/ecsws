#!/bin/bash

aws --profile "${AWS_PROFILE}" --region "${AWS_DEFAULT_REGION}" \
    cloudformation list-exports \
    --query 'Exports[*].[Name,Value]' --output text | \
    sed 's/\t/: /g' > "${YTT}/output/cfn-stack-exports.yaml"

echo -e "#@data/values-schema\n---\n$(cat ${YTT}/output/cfn-stack-exports.yaml)" > "${YTT}/output/cfn-stack-values-schema.yaml"

ytt -f "${YTT}/values/values.yaml" \
    -f "${YTT}/output/cfn-stack-values-schema.yaml" \
    --output-files "${YTT}/output"

echo -e "#@data/values-schema\n---\n$(cat ${YTT}/output/values.yaml)" > "${YTT}/templates/values.yaml"
