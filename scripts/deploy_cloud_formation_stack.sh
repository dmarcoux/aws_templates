#!/usr/bin/env bash

cd "$(dirname "$0")" || exit
source ./env

# For IAM with a generated name
# aws cloudformation deploy --stack-name "$CLOUD_FORMATION_STACK_NAME" --template-file "$CLOUD_FORMATION_FILE" --capabilities CAPABILITY_IAM --region "$AWS_REGION"

# For IAM with a specific name
# aws cloudformation deploy --stack-name "$CLOUD_FORMATION_STACK_NAME" --template-file "$CLOUD_FORMATION_FILE" --capabilities CAPABILITY_NAMED_IAM --region "$AWS_REGION"
