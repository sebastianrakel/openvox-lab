#!/usr/bin/env bash

node_name=""

# Parse args
while [[ $# -gt 0 ]]; do
    case "$1" in
	--node_name)
	    node_name="${2:-}"
	    shift 2
	    ;;
	--node_name=*)
	    node_name="${1#*=}"
	    shift
	    ;;
	*)
	    echo "Unknown argument: $1" >&2
	    exit 1
	    ;;
    esac
done

if [[ -z "$node_name" ]]; then
    read -rp "Enter node name: " node_name
fi

if [[ -z "$node_name" ]]; then
    echo "Error: node name is required." >&2
    exit 1
fi

