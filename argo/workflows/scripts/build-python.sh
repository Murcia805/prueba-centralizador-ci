#!/bin/sh
set -e

VERSION=${1:-""}

if [ -z "$VERSION" ]; then
  echo "Error: Version parameter is required"
  echo "Usage: $0 <version>"
  exit 1
fi

echo "Starting Python $VERSION build..."

case $VERSION in
  3.7|3.8|3.9|3.10|3.11)
    echo "Building Python $VERSION project..."
    cd /workspace/repo
    pip install --upgrade pip
    pip install -r requirements.txt
    python setup.py build
    ;;
  *)
    echo "Error: Unsupported Python version: $VERSION"
    echo "Supported versions: 3.7, 3.8, 3.9, 3.10, 3.11"
    exit 1
    ;;
esac

echo "Build completed successfully!"
