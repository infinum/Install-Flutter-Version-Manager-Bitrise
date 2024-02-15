#!/bin/bash
set -ex

FVM_FLUTTER_VERSION="$(grep -o '"flutter": "[^"]*' .fvmrc | grep -o '[^"]*$')"
envman add --key FVM_FLUTTER_VERSION --value $FVM_FLUTTER_VERSION
