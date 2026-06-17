FROM python:3.12-slim

# Install system dependencies (including ca-certificates for secure curl fetches)
RUN apt-get update && apt-get install -y \
    curl \
    git \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Install DVC with S3 support
RUN pip install --no-cache-dir "dvc[s3]"

# Install Kustomize CLI
RUN curl -fsSL "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash \
 && mv kustomize /usr/local/bin/ \
 && chmod +x /usr/local/bin/kustomize

WORKDIR /workspace