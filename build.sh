#!/bin/sh
set -eo pipefail

echo "building local docker image for pdfmerger application"
docker build -t messier31/pdfmerger .
echo "docker build finished"