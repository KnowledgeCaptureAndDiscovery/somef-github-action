#!/bin/sh -l

echo "Inputs:"
echo "  codemeta-file: $1"
echo "  repository: $2"

if [ -f "$1" ]
then
  echo "Codemeta file exists. Exiting."
else
  generation-success=$(somef describe --repo_url $2 --codemeta_out $1)
  echo "::set-output name=generation-success::$generation-success"
fi
