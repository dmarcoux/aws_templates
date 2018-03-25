#!/usr/bin/env bash

cd "$(dirname "$0")" || exit
source ./env

aws ecr delete-repository --repository-name "$ECR_REPOSITORY_NAME" --force
