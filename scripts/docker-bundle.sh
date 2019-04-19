#!/bin/sh
set -e
if [[ "${@}" = "production" ]]; then
    bundle install --with production --without development test
else
    bundle install --with production development test
fi
