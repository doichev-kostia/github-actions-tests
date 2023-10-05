#!/usr/bin/env bash

# REQUIRES:
# - GITHUB_REF ${{ github.ref }}
# - GITHUB_SHA ${{ github.sha }}
# - GITHUB_ENV

is_tag="false"

echo "GITHUB_REF: $GITHUB_REF"

if [[ "$GITHUB_REF" == "tag" ]]; then
    is_tag="true"
fi

if [[ $is_tag == "true" ]]; then
  echo "app version: $GITHUB_REF"
  echo "APP_VERSION=$GITHUB_REF" >> "$GITHUB_ENV"
else
  sha_full="$GITHUB_SHA"
  version="${sha_full:0:7}"
  echo "app version: $version"
  echo "APP_VERSION=$version" >> "$GITHUB_ENV"
fi
