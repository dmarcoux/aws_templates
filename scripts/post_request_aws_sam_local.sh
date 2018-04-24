#!/usr/bin/env bash

cd "$(dirname "$0")" || exit
source ./env

curl --verbose --header 'Content-Type: application/json' --data @"$EVENT_JSON_FILE" "$SAM_LOCAL_API_HOST":"$SAM_LOCAL_API_PORT"
