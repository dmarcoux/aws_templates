#!/usr/bin/env bash

cd "$(dirname "$0")" || exit
source ./env

$(aws ecr get-login --no-include-email --region "$AWS_REGION")
