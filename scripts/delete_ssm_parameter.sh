#!/usr/bin/env bash

cd "$(dirname "$0")" || exit
source ./env

echo 'Provide input to delete a SSM parameter'
echo -n "Enter the parameter's name and press [ENTER]: "
read -r NAME

if [ -z "$NAME" ]; then
  echo 'Name is empty.'

  exit 1
fi

aws ssm delete-parameter --name "$NAME"
