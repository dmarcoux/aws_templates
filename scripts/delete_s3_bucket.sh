#!/usr/bin/env bash

cd "$(dirname "$0")" || exit
source ./env

aws s3 rb s3://"$S3_BUCKET" --force
