#!/bin/sh -l

codemeta_file=$1

if [ $2 == "None" ]
then
  repository_url="https://github.com/${{ $GITHUB_REPOSITORY }}"
else
  repository_url=$2
fi

echo "Inputs:"
echo "  codemeta-file: $codemeta_file"
echo "  repository: $repository_url"


if [ -f "$1" ]
then
  echo "Codemeta file exists. Exiting."
else
  somef configure --auto
#   generation=$(somef describe --repo_url $2 --codemeta_out $1)
#   echo "::set-output name=generation-success::$generation"
  somef describe --repo_url $repository_url --codemeta_out $codemeta_file
fi
