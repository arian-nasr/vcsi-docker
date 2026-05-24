FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

ARG DEBIAN_FRONTEND=noninteractive

# ffmpeg dependencies for vcsi
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    libjpeg-dev \
    zlib1g-dev \
    build-essential \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN uv tool install vcsi

WORKDIR /work

CMD ["vcsi"]