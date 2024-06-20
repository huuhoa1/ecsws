#!/bin/bash

set -ex

echo "Deleting the appserver service..."

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" update-service \
    --desired-count 0 --service "${SVC_APPSERVER}" --cluster "${USECASE2_CLUSTER1}"

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" delete-service \
    --service "${SVC_APPSERVER}" --cluster "${USECASE2_CLUSTER1}"


echo "Deleting the ui service..."

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" update-service \
    --desired-count 0 --service "${SVC_UI}" --cluster "${USECASE2_CLUSTER1}"

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" delete-service \
    --service "${SVC_UI}" --cluster "${USECASE2_CLUSTER1}"


echo "Deleting the redis service..."

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" update-service \
    --desired-count 0 --service "${SVC_REDIS}" --cluster "${USECASE2_CLUSTER2}"

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" delete-service \
    --service "${SVC_REDIS}" --cluster "${USECASE2_CLUSTER2}"


echo "Deleting the db service..."

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" update-service \
    --desired-count 0 --service "${SVC_DB}" --cluster "${USECASE2_CLUSTER2}"

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" delete-service \
    --service "${SVC_DB}" --cluster "${USECASE2_CLUSTER2}"


echo "Waiting for the services and tasks to clean up..."
sleep 60

echo "Deleting the ECS Cluster - ${USECASE2_CLUSTER1}..."

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" delete-cluster \
    --cluster "${USECASE2_CLUSTER1}"

echo "Deleting the ECS Cluster - ${USECASE2_CLUSTER2}..."

aws --region "${AWS_DEFAULT_REGION}" \
    "${ECS}" delete-cluster \
    --cluster "${USECASE2_CLUSTER2}"

echo "Deleted the ECS resources..."
