#!/usr/bin/env bash

cd "$(dirname "$0")" || exit
source ./env

if ! type jq > /dev/null; then
  echo 'Install jq before running this script'

  exit 1
fi

aws cloudformation create-change-set --stack-name "$CLOUD_FORMATION_STACK_NAME" --template-body "file://$CLOUD_FORMATION_FILE" --capabilities CAPABILITY_IAM --change-set-name "$CLOUD_FORMATION_PREVIEW_CHANGE_SET_NAME"

sleep 1s # second

aws cloudformation describe-change-set --stack-name "$CLOUD_FORMATION_STACK_NAME" --change-set-name "$CLOUD_FORMATION_PREVIEW_CHANGE_SET_NAME" | jq --color-output '.Changes[]' | less --raw-control-chars

aws cloudformation delete-change-set --stack-name "$CLOUD_FORMATION_STACK_NAME" --change-set-name "$CLOUD_FORMATION_PREVIEW_CHANGE_SET_NAME"
