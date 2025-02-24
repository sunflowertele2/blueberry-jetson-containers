#!/usr/bin/env bash
# launcher for blueberry_jetson_containers/build.py (see docs/build.md)
ROOT="$(dirname "$(readlink -f "$0")")"
PYTHONPATH="$PYTHONPATH:$ROOT" python3 -m blueberry_jetson_containers.build "$@"
