#!/bin/sh -l

echo "Inputs:"
echo "  codemeta-file: $1"
echo "  repository: $2"
echo "repoenv: $GITHUB_REPOSITORY"

if [ -f "$1" ]
then
  echo "Codemeta file exists. Exiting."
else
  somef configure --auto
#   generation=$(somef describe --repo_url $2 --codemeta_out $1)
#   echo "::set-output name=generation-success::$generation"
  somef describe --repo_url $2 --codemeta_out $1
fi
