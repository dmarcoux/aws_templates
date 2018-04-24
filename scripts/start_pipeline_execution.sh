#!/usr/bin/env bash

cd "$(dirname "$0")" || exit
source ./env

aws codepipeline start-pipeline-execution --name "$PIPELINE_NAME"
