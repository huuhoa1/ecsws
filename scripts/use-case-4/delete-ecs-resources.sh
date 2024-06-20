#!/bin/bash

set -ex

echo "Deleting the appserver service..."

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" update-service \
    --desired-count 0 --service "${SVC_APPSERVER}" --cluster "${USECASE4_CLUSTER}"

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" delete-service \
    --service "${SVC_APPSERVER}" --cluster "${USECASE4_CLUSTER}"


echo "Deleting the ui service..."

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" update-service \
    --desired-count 0 --service "${SVC_UI}" --cluster "${USECASE4_CLUSTER}"

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" delete-service \
    --service "${SVC_UI}" --cluster "${USECASE4_CLUSTER}"


echo "Deleting the redis service..."

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" update-service \
    --desired-count 0 --service "${SVC_REDIS}" --cluster "${USECASE4_CLUSTER}"

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" delete-service \
    --service "${SVC_REDIS}" --cluster "${USECASE4_CLUSTER}"


echo "Deleting the db service..."

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" update-service \
    --desired-count 0 --service "${SVC_DB}" --cluster "${USECASE4_CLUSTER}" 1>/dev/null

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" delete-service \
    --service "${SVC_DB}" --cluster "${USECASE4_CLUSTER}" 1>/dev/null


echo "Waiting for the services and tasks to clean up..."
sleep 60

echo "Deleting the ECS Cluster - ${USECASE4_CLUSTER}..."

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" delete-cluster \
    --cluster "${USECASE4_CLUSTER}" 1>/dev/null

echo "Deleted the ECS resources..."
