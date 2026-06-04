#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$script_dir/common.sh"

full_node_name="node-${node_name}"

echo "Creating container: ${full_node_name}"
podman run -ti \
       --name "${full_node_name}" \
       --hostname "${full_node_name}" \
       --network openvox-lab \
       --entrypoint "/bin/bash" \
       ghcr.io/openvoxproject/openvoxagent:latest \
       -c "/opt/puppetlabs/bin/puppet agent -t --server puppet --certname ${full_node_name}; bash"

podman logs -f "${full_node_name}"
