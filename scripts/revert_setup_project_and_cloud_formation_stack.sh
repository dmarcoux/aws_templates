#!/usr/bin/env bash

cd "$(dirname "$0")" || exit
source ./env

rm "$EVENT_JSON_FILE"
(aws s3api get-bucket-location --bucket "$BACKEND_S3_BUCKET" --region "$AWS_REGION" && ./delete_s3_bucket.sh)
./delete_cloud_formation_stack.sh
rm -rf "$NODE_MODULES_DIR"
