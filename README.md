Dockerfile for GDClip
=====================

This repo provides a bare Dockerfile with tool dependencies and some patches
to build GDClip library for Linux, macOS, and Windows. For now, GDClip is
built for x86_64.

## Building GDClip

```
git clone https://github.com/hansemro/GDClip-docker
cd GDClip-docker
docker build -t gdclip-docker .
git clone --recurse-submodules https://github.com/hansemro/GDClip
cd GDClip/godot-cpp
git apply ../../*.patch
cd ..
docker run --rm -t \
    -u $(id -u $USER):$(id -g $USER) \
    -v $(pwd):/GDClip \
    gdclip-docker \
    bash -c "cd /GDClip && make PLATFORM=linux NPROC=$(nproc)"
docker run --rm -t \
    -u $(id -u $USER):$(id -g $USER) \
    -v $(pwd):/GDClip \
    -e CXX=o64-clang++ \
    gdclip-docker \
    bash -c "cd /GDClip && make PLATFORM=osx NPROC=$(nproc)"
docker run --rm -t \
    -u $(id -u $USER):$(id -g $USER) \
    -v $(pwd):/GDClip \
    -e CXX=x86_64-w64-mingw32-g++ \
    gdclip-docker \
    bash -c "cd /GDClip && make PLATFORM=windows NPROC=$(nproc)"
```

Libraries are built at `GDClip/bin/`
