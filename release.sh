#!/bin/sh
set -eo pipefail

echo "only for me ;-) pushing to docker hub"
docker login
docker push messier31/pdfmerger
echo "pushed"