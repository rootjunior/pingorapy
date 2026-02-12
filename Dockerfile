FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

WORKDIR /app

# Установим системные зависимости для сборки Rust + pyo3
RUN apt update && apt install -y \
    build-essential \
    cmake \
    pkg-config \
    libssl-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY . . 

RUN uv sync --reinstall -v


EXPOSE 6188

CMD ["uv", "run", "main.py"]
