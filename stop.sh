#!/bin/bash

# Define container names
CONTAINERS=("grpc-server" "grpc-client")

for CONTAINER in "${CONTAINERS[@]}"; do
    # Check if the container is running
    if podman ps --format "{{.Names}}" | grep -q "^${CONTAINER}$"; then
        echo "🛑 Stopping container: $CONTAINER ..."
        podman stop "$CONTAINER"
    else
        echo "⚠️ Container '$CONTAINER' is not running or does not exist."
    fi
done
