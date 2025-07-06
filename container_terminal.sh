#!/bin/bash

# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
    echo "❌ Error: You must provide one argument: grpc-server or grpc-client"
    echo "✅ Usage: $0 grpc-server | grpc-client"
    exit 1
fi

ROLE=$1

# Validate the argument
if [ "$ROLE" != "grpc-server" ] && [ "$ROLE" != "grpc-client" ]; then
    echo "❌ Error: Invalid argument. Must be grpc-server or grpc-client"
    echo "✅ Usage: $0 grpc-server | grpc-client"
    exit 1
fi

# Execute podman shell into the specified container
echo "🚀 Entering container: $ROLE"
podman exec -it "$ROLE" /bin/bash
