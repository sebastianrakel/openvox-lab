#!/usr/bin/env bash

function choose_cert() {
    certname=$(podman exec -ti openvox-lab_openvoxserver_1 puppetserver ca list --all --format json | jq -r '.[] | .[] | .name' | fzf --prompt='Select cert: ')

    [[ -n "${certname:-}" ]] || { echo "certname is empty"; exit 1; }
    
    echo "${certname}"
}
