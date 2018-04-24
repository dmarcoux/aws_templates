#!/usr/bin/env bash

# -e: Exit on commands not found
# -u: Exit on unset variables
# -x: Write to standard error a trace for each command after it expands the command and before it executes it
set -eux

# Check if AWS Encryption CLI is installed, just in case people don't read the README...
if ! type aws-encryption-cli > /dev/null 2>&1; then
  echo 'Install AWS Encryption CLI before running scripts. Refer to the README'

  exit 1
fi

if [ -z "$1" ]; then
  echo 'Execute this script with at least one file'
  echo "Example: ./$0 file1 dir/file2"

  exit 1
fi

FILES=( "$@" )

for file in "${FILES[@]}"; do
  output_file="${file/%.encrypted/}"

  aws-encryption-cli --suppress-metadata --decrypt --input "$file" --output ./"$output_file"
done
