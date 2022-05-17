# NGINX Plus Dockerfiles

Run `./build-nginx-plus.sh [build_name]`, where `[build_name]`

NGINX Plus with Wallarm Module

| `[build_name]`            | Description           |
| ------------------------- |--------------------------------------------------|
|`debian10`                 | Debian 10     |
|`ubuntu20.04`              | Ubuntu 20.04  |

## Build NGINX Plus Docker container using script

 1. Prepare your NGINX license files in the correct build directories:
      * **For NGINX Plus:** Copy your `nginx-repo.crt` and `nginx-repo.key` into [`etc/ssl/nginx`](./NGINX-PLUS/ssl/nginx) directory

 2. Build an image from your Dockerfile:
    ```bash
    # ./build-nginx-plus.sh [Build-name]
    $ ./build-nginx-plus.sh debian10
    ```
    
## Useful Docker commands


 1. To run commands in the docker container you first need to start a bash session inside the nginx container
    ```bash
    # get Docker IDs of running containers
    docker ps
    # Enter a Alpine Linux BusyBox shell
    sudo docker exec -i -t [CONTAINER ID] /bin/sh
    # OR
    # Enter a Linux Bash shell
    sudo docker exec -i -t [CONTAINER ID] /bin/bash
    ```

 2. To open logs
    ```bash
    # get Docker IDs of running containers
    docker ps
    # View and follow container logs
    sudo docker logs -f [CONTAINER ID]
    ```
