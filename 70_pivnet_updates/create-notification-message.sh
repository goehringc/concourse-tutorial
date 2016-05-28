#!/bin/bash

version=$(cat pivnet-stemcells/metadata.json | jq -r ".Release.Version")
release_type=$(cat pivnet-stemcells/metadata.json | jq -r ".Release.ReleaseType")
description=$(cat pivnet-stemcells/metadata.json | jq -r ".Release.Description")

echo $release_type
echo $description

cat > pivnet-message/message << EOF
*${release_type}* ${version}
${description}
https://network.pivotal.io/products/${slug}
EOF
