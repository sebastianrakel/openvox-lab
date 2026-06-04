#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$script_dir/lib/certs.sh"

certname=$(choose_cert)

echo "Rerun agent in container: ${certname}"
podman start -a "${certname}"

