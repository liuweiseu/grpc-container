#!/bin/bash

SERVER_IP='10.88.0.3'
CLIENT_IP='10.88.0.4'
SERVER_SSH_PORT=5932
CLIENT_SSH_PORT=5933
MOUNT_DIR='/Users/wei/Projects/fun/rpc/'
IMAGE='localhost/grpc:V1.0'

# Create grpc-server container if it doesn't exist
if ! podman container exists grpc-server; then
    echo "🛠️ Creating container: grpc-server"
    podman run -itd --name grpc-server \
        --hostname=grpc-server \
        -v ${MOUNT_DIR}:/home/ubuntu/rpc \
        --cap-add=CAP_NET_RAW \
        --ip=${SERVER_IP} \
        -p ${SERVER_SSH_PORT}:22 \
        ${IMAGE}
else
    echo "✅ Container 'grpc-server' already exists. Skipping creation."
fi

# Create grpc-client container if it doesn't exist
if ! podman container exists grpc-client; then
    echo "🛠️ Creating container: grpc-client"
     podman run -itd --name grpc-client \
         --hostname=grpc-client \
         -v ${MOUNT_DIR}:/home/ubuntu/rpc \
         --cap-add=CAP_NET_RAW \
         --ip=${CLIENT_IP} \
         -p ${CLIENT_SSH_PORT}:22 \
         ${IMAGE}
else
    echo "✅ Container 'grpc-client' already exists. Skipping creation."
fi
