# piper-tts

> [`CONTAINERS`](#user-content-containers) [`IMAGES`](#user-content-images) [`RUN`](#user-content-run) [`BUILD`](#user-content-build)

<details open>
<summary><b><a id="containers">CONTAINERS</a></b></summary>
<br>

| **`piper-tts`** | |
| :-- | :-- |
| &nbsp;&nbsp;&nbsp;Requires | `L4T ['>=32.6']` |
| &nbsp;&nbsp;&nbsp;Dependencies | [`build-essential`](/packages/build/build-essential) [`cuda`](/packages/cuda/cuda) [`cudnn`](/packages/cuda/cudnn) [`python`](/packages/build/python) [`tensorrt`](/packages/tensorrt) [`cmake`](/packages/build/cmake/cmake_pip) [`numpy`](/packages/numpy) [`onnx`](/packages/onnx) [`onnxruntime`](/packages/onnxruntime) |
| &nbsp;&nbsp;&nbsp;Dependants | [`wyoming-piper:master`](/packages/smart-home/wyoming/piper) |
| &nbsp;&nbsp;&nbsp;Dockerfile | [`Dockerfile`](Dockerfile) |
| &nbsp;&nbsp;&nbsp;Images | [`dustynv/piper-tts:r35.4.1`](https://hub.docker.com/r/dustynv/piper-tts/tags) `(2024-04-07, 5.5GB)`<br>[`dustynv/piper-tts:r36.2.0`](https://hub.docker.com/r/dustynv/piper-tts/tags) `(2024-04-07, 6.7GB)` |

</details>

<details open>
<summary><b><a id="images">CONTAINER IMAGES</a></b></summary>
<br>

| Repository/Tag | Date | Arch | Size |
| :-- | :--: | :--: | :--: |
| &nbsp;&nbsp;[`dustynv/piper-tts:r35.4.1`](https://hub.docker.com/r/dustynv/piper-tts/tags) | `2024-04-07` | `arm64` | `5.5GB` |
| &nbsp;&nbsp;[`dustynv/piper-tts:r36.2.0`](https://hub.docker.com/r/dustynv/piper-tts/tags) | `2024-04-07` | `arm64` | `6.7GB` |

> <sub>Container images are compatible with other minor versions of JetPack/L4T:</sub><br>
> <sub>&nbsp;&nbsp;&nbsp;&nbsp;• L4T R32.7 containers can run on other versions of L4T R32.7 (JetPack 4.6+)</sub><br>
> <sub>&nbsp;&nbsp;&nbsp;&nbsp;• L4T R35.x containers can run on other versions of L4T R35.x (JetPack 5.1+)</sub><br>
</details>

<details open>
<summary><b><a id="run">RUN CONTAINER</a></b></summary>
<br>

To start the container, you can use [`blueberry-jetson-containers run`](/docs/run.md) and [`autotag`](/docs/run.md#autotag), or manually put together a [`docker run`](https://docs.docker.com/engine/reference/commandline/run/) command:
```bash
# automatically pull or build a compatible container image
blueberry-jetson-containers run $(autotag piper-tts)

# or explicitly specify one of the container images above
blueberry-jetson-containers run dustynv/piper-tts:r36.2.0

# or if using 'docker run' (specify image and mounts/ect)
sudo docker run --runtime nvidia -it --rm --network=host dustynv/piper-tts:r36.2.0
```
> <sup>[`blueberry-jetson-containers run`](/docs/run.md) forwards arguments to [`docker run`](https://docs.docker.com/engine/reference/commandline/run/) with some defaults added (like `--runtime nvidia`, mounts a `/data` cache, and detects devices)</sup><br>
> <sup>[`autotag`](/docs/run.md#autotag) finds a container image that's compatible with your version of JetPack/L4T - either locally, pulled from a registry, or by building it.</sup>

To mount your own directories into the container, use the [`-v`](https://docs.docker.com/engine/reference/commandline/run/#volume) or [`--volume`](https://docs.docker.com/engine/reference/commandline/run/#volume) flags:
```bash
blueberry-jetson-containers run -v /path/on/host:/path/in/container $(autotag piper-tts)
```
To launch the container running a command, as opposed to an interactive shell:
```bash
blueberry-jetson-containers run $(autotag piper-tts) my_app --abc xyz
```
You can pass any options to it that you would to [`docker run`](https://docs.docker.com/engine/reference/commandline/run/), and it'll print out the full command that it constructs before executing it.
</details>
<details open>
<summary><b><a id="build">BUILD CONTAINER</b></summary>
<br>

If you use [`autotag`](/docs/run.md#autotag) as shown above, it'll ask to build the container for you if needed.  To manually build it, first do the [system setup](/docs/setup.md), then run:
```bash
blueberry-jetson-containers build piper-tts
```
The dependencies from above will be built into the container, and it'll be tested during.  Run it with [`--help`](/blueberry_jetson_containers/build.py) for build options.
</details>
