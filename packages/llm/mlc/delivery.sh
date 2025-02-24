#!/usr/bin/env bash
set -ex

: "${MLC_VERSION:=0.1.4}"

blueberry-jetson-containers run \
  -e HF_TOKEN=$HF_TOKEN \
  -e MLC_TEMP_DIR=/data/models/mlc/cache \
  -v $(blueberry-jetson-containers root):/blueberry-jetson-containers \
  $(autotag mlc:${MLC_VERSION}) \
    python3 -m mlc_llm.cli.delivery \
      --username dusty-nv \
      --spec /blueberry-jetson-containers/packages/llm/mlc/delivery.json \
      --log /data/models/mlc/delivery/model-delivered-log.json \
      --output /data/models/mlc/delivery/output \
      --hf-local-dir /data/models/mlc/delivery/hf 
      
set +x

printf "\n\nMLC model delivery report:\n"
cat $(blueberry-jetson-containers data)/models/mlc/delivery/model-delivered-log.json
printf "\nMLC model delivery complete\n"