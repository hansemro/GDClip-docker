FROM ubuntu:21.10

RUN apt-get update && apt-get install -y clang lld libc6-dev

COPY --from=crazymax/osxcross:latest /osxcross /osxcross

ENV PATH="/osxcross/bin:$PATH"

ENV LD_LIBRARY_PATH="/osxcross/lib:$LD_LIBRARY_PATH"

RUN apt-get install -y \
    git \
    python3 \
    python3-pip \
    make \
    libpng-dev \
    libx11-dev \
    mingw-w64

RUN pip3 install scons
