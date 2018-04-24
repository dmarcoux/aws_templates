#!/usr/bin/env bash

cd "$(dirname "$0")" || exit
source ./env

echo 'Provide input to create a SSM parameter'
echo -n "Enter the parameter's name and press [ENTER]: "
read -r NAME

echo -n "Enter the parameter's description and press [ENTER]: "
read -r DESCRIPTION

echo -n "Enter the parameter's value and press [ENTER]: "
read -r VALUE

if [ -z "$NAME" ] || [ -z "$DESCRIPTION" ] || [ -z "$VALUE" ]; then
  echo 'Input is missing.'

  exit 1
fi

aws ssm put-parameter --name "$NAME" --description "$DESCRIPTION" --type 'String' --value "$VALUE"
