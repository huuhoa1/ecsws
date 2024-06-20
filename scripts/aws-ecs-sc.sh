#!/bin/bash

set -ex

aws configure add-model --service-name ecs-sc --service-model file://${SPATH}/scripts/ecs-sm-sc.json

aws iam create-service-linked-role --aws-service-name ecs.amazonaws.com
