#!/bin/sh
set -euo pipefail
export TMPDIR=/var/tmp

#Vendor the gems for deployment, excluding the development group
bundle install --deployment --without=development
