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

# The substition with ${var-} is needed for `set -u` to not trigger on undefined variables. Otherwise, we couldn't provide feedback to the user
if [ -z "${AWS_KMS_MASTER_KEY_ID-}" ] || [ -z "${AWS_KMS_KEY_ID-}" ] || [ -z "$1" ]; then
  echo 'Execute this script with ENV variables AWS_KMS_MASTER_KEY_ID and AWS_KMS_KEY_ID set and at least one file'
  echo "Example: AWS_KMS_MASTER_KEY_ID=123 AWS_KMS_KEY_ID=456 ./$0 file1 dir/file2"

  exit 1
fi

FILES=( "$@" )

for file in "${FILES[@]}"; do
  aws-encryption-cli --master-keys key="$AWS_KMS_MASTER_KEY_ID" key="$AWS_KMS_KEY_ID" --suppress-metadata --encrypt --input "$file" --output ./"$file".encrypted
done
