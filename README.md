# grpc-container
These scripts are used for creating containers for grpc tests.
# How to use the scripts:
1. install podman(recommended) or docker
2. pull the image
    ```
    podman pull ghcr.io/liuweiseu/grpc:v1.0
    ```
3. run the scripts to create/start/stop/delete the containrs
    ```
    # create containers
    ./setup.sh
    # resatrt containers
    ./restart.sh
    # stop containers
    ./stop.sh
    # delete containers
    ./del.sh
    ```
4. start terminal to start ssh on the container
    ```
    # For grpc-server 
    ./terminal grpc-server
    service ssh restart
    # Fro grpc-client
    ./terminal grpc-client
    service ssh client
    ```
