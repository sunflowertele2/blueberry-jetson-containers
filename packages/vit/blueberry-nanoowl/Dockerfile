#---
# name: blueberry-nanoowl
# group: vit
# depends: [pytorch, torch2trt, transformers, opencv, gstreamer]
# requires: '>=34.1.0'
# test: test.sh
# docs: docs.md
#---
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG BLUEBERRY-NANOOWL_REPO=sunflowertele2/blueberry-nanoowl \
    BLUEBERRY-NANOOWL_BRANCH=main

RUN pip3 install --verbose --no-cache-dir 'matplotlib<3.9' && \
    pip3 install --verbose --no-cache-dir git+https://github.com/openai/CLIP.git && \
    mkdir -p /root/.cache && \
    ln -sf /data/models/clip /root/.cache/clip

ADD https://api.github.com/repos/${BLUEBERRY-NANOOWL_REPO}/git/refs/heads/${BLUEBERRY-NANOOWL_BRANCH} /tmp/blueberry-nanoowl_version.json

RUN git clone --branch=${BLUEBERRY-NANOOWL_BRANCH} https://github.com/${BLUEBERRY-NANOOWL_REPO} /opt/blueberry-nanoowl && \
    cd /opt/blueberry-nanoowl && \
    git checkout main && \
    python3 setup.py develop

RUN cd /opt/blueberry-nanoowl && \
    mkdir data && \
    python3 -m blueberry-nanoowl.build_image_encoder_engine \
        data/owl_image_encoder_patch32.engine \
        --onnx_opset=16

    


