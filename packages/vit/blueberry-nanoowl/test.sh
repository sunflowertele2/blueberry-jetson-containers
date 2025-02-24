#!/usr/bin/env bash
set -e
echo "testing Blueberry-nanoowl..."

cd /opt/blueberry-nanoowl/examples

python3 owl_predict.py \
    --prompt="[an owl, a glove]" \
    --threshold=0.1 \
    --image_encoder_engine=../data/owl_image_encoder_patch32.engine

echo "Blueberry-nanoowl OK"
