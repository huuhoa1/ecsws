#!/bin/bash

# export SPATH="/Users/hemntaws/code/internal/service-connect-example"

export AWS_DEFAULT_REGION="us-west-2"
export ENVIRONMENT_NAME="ecsws"

export USECASE1="serviceconnect1"
export USECASE2="serviceconnect2"
export USECASE4="serviceconnect4"

export USECASE1_NS="yelb."${USECASE1}.internal
export USECASE1_CLUSTER=${USECASE1}-cluster

export USECASE2_NS="yelb."${USECASE2}.internal
export USECASE2_CLUSTER1=${USECASE2}-cluster-1
export USECASE2_CLUSTER2=${USECASE2}-cluster-2

export USECASE4_NS="yelb."${USECASE4}.internal
export USECASE4_CLUSTER=${USECASE4}-cluster

export USECASE4_INTERNAL_NS="yelb.cloudmap.internal"
export USECASE4_INTERNAL_LB_NS="yelb.lb.internal"

export YTT=${SPATH}/ytt

export SVC_APPSERVER=yelb-appserver
export SVC_UI=yelb-ui
export SVC_REDIS=yelb-redis
export SVC_DB=yelb-db

export ECS=ecs

export AWS_PAGER=""
