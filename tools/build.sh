#!/usr/bin/env sh
# The github build action uses the official nodejs container does not have bash
# so this script must be POSIX sh compliant

set -e
cd "$(dirname "$0")/.."
PATH=$PWD/node_modules/.bin:$PATH
export LOGFORMAT=cli

main() {
  rm -Rf dist/
  mkdir -p dist/
  mocha
  cp -r index.js LICENSE README.md bin/ dist/
}

main "$@"
