#!/bin/sh
set -e

VERSION=${1:-""}

if [ -z "$VERSION" ]; then
  echo "Error: Version parameter is required"
  echo "Usage: $0 <version>"
  exit 1
fi

echo "Starting Java $VERSION build with Gradle..."

case $VERSION in
  8|11)
    echo "Building standard Java $VERSION project..."
    cd /workspace/repo
    gradle clean build -x test
    ;;
  21)
    echo "Building Java 21 InversionVirtual project..."
    cd /workspace/repo/InversionVirtual
    gradle clean build -x test
    ;;
  *)
    echo "Error: Unsupported Java version: $VERSION"
    echo "Supported versions: 8, 11, 21"
    exit 1
    ;;
esac

echo "Build completed successfully!"
