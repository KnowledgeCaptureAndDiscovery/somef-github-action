#!/bin/bash 

# initialize the variables
codemeta_file=$1
# repository_url=""

# assign repo-url
# if [ $2 == "None" ] 
# then
#   repository_url="https://github.com/${{ github.repository }}"
# else
#   repository_url=$2
# fi

repository_url=$2

# show inputs
echo "Inputs:"
echo "  codemeta-file: $codemeta_file"
echo "  repository: $repository_url"

# check codemeta file
if [ -f "$codemeta_file" ]
then
  echo "Codemeta file exists. Exiting."
else
  somef configure --auto
#   generation=$(somef describe --repo_url $2 --codemeta_out $1)
#   echo "::set-output name=generation-success::$generation"
  somef describe --repo_url $repository_url --codemeta_out $codemeta_file
fi
