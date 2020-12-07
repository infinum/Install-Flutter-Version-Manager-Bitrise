#!/bin/bash
set -ex

# Install FVM
pub global activate fvm
export PATH="$PATH":"$HOME/.pub-cache/bin"
fvm install

# Read fvm flutter version from project
FVM_FLUTTER_VERSION="$(grep -o '"flutterSdkVersion": "[^"]*' .fvm/fvm_config.json | grep -o '[^"]*$')"
envman add --key FVM_FLUTTER_VERSION --value $FVM_FLUTTER_VERSION

# Replace PATH to include fvms flutter first
envman add --key PATH --value '/Users/vagrant/fvm/versions/$FVM_FLUTTER_VERSION/bin:$PATH'

# Echo path to console
envman run bash -c 'echo "Modified path: $PATH"'