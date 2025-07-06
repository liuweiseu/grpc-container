#!/bin/bash

# Define container names
CONTAINERS=("grpc-server" "grpc-client")

for CONTAINER in "${CONTAINERS[@]}"; do
    # Check if the container exists
    if podman container exists "$CONTAINER"; then
        echo "🗑️ Removing container: $CONTAINER ..."
        podman rm -f "$CONTAINER"
    else
        echo "⚠️ Container '$CONTAINER' does not exist. Skipping."
    fi
done
