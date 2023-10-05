#!/usr/bin/env bash

# REQUIRES:
# - GITHUB_REF_TYPE ${{ env.GITHUB_REF_TYPE }} - tag or branch
# - GITHUB_REF_NAME ${{ env.GITHUB_REF_NAME }}
# - GITHUB_SHA ${{ github.sha }}
# - GITHUB_ENV

is_tag="false"

echo "GITHUB_REF_TYPE: $GITHUB_REF_TYPE"

if [[ "$GITHUB_REF_TYPE" == "tag" ]]; then
    is_tag="true"
fi

if [[ $is_tag == "true" ]]; then
  echo "app version: $GITHUB_REF_NAME"
  echo "APP_VERSION=$GITHUB_REF_NAME" >> "$GITHUB_ENV"
else
  sha_full="$GITHUB_SHA"
  version="${sha_full:0:7}"
  echo "app version: $version"
  echo "APP_VERSION=$version" >> "$GITHUB_ENV"
fi
