#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

echo "127.0.0.1 example.com"  >> /etc/hosts


echo "hosts are updated"

docker compose up -d
