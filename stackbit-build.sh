#!/usr/bin/env bash

set -e
set -o pipefail
set -v

if [[ -z "${STACKBIT_API_KEY}" ]]; then
    echo "WARNING: No STACKBIT_API_KEY environment variable set, skipping stackbit-pull"
else
    npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5d4c7242374df8001158c15d 
fi
cd exampleSite && hugo --gc --baseURL "/" --themesDir ../.. && cd ..
./inject-netlify-identity-widget.js exampleSite/public
