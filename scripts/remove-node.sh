#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$script_dir/lib/certs.sh"
certname=$(choose_cert)

echo "Removing fron Openvox Server: ${certname}"

podman exec -ti openvox-lab_openvoxserver_1 puppetserver ca clean --certname "${certname}" || true
podman exec -ti openvox-lab_openvoxserver_1 puppet node clean "${certname}" || true
podman exec -ti openvox-lab_openvoxserver_1 puppet node deactivate "${certname}" || true

echo "Removing Container: ${certname}"
podman rm -f "${certname}"
