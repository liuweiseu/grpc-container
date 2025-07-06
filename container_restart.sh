#!/bin/bash

# Define container names
CONTAINERS=("grpc-server" "grpc-client")

for CONTAINER in "${CONTAINERS[@]}"; do
    # Check if container exists
    if podman container exists "$CONTAINER"; then
        # Check if it's already running
        if podman inspect -f '{{.State.Running}}' "$CONTAINER" | grep -q true; then
            echo "✅ Container '$CONTAINER' is already running."
        else
            echo "🚀 Starting container '$CONTAINER'..."
            podman start "$CONTAINER"
        fi
    else
        echo "❌ Container '$CONTAINER' does not exist."
        echo "👉 You may need to create it first using 'podman run ...'"
    fi
done
