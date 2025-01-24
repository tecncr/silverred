#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Get latest version and strip 'v' prefix

LATEST_VERSION=$(curl -sL https://api.github.com/repos/balena-io/etcher/tags \
  | jq -r '.[0].name')

VERSION_NUM=${LATEST_VERSION#v}

# Download latest release using dynamic version
curl -L "https://github.com/balena-io/etcher/releases/download/${LATEST_VERSION}/balena-etcher-${VERSION_NUM}-1.x86_64.rpm" -o /tmp/balena-etcher-${VERSION_NUM}-1.x86_64.rpm

# Install the downloaded package with rpm-ostree
rpm-ostree install /tmp/balena-etcher-${VERSION_NUM}-1.x86_64.rpm