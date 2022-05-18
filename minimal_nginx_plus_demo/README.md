# NGINX Plus with Wallarm Dockerfiles


## Build NGINX Plus with Wallarm Docker container

 1. Prepare your NGINX license files in the correct build directories:
      * **For NGINX Plus:** Copy your `nginx-repo.crt` and `nginx-repo.key` into [`etc/ssl/nginx`](./NGINX-PLUS/ssl/nginx) directory

 2. Build an image from your Dockerfile:
    ```bash
    cd NGINX-PLUS
    sudo docker build --no-cache -t nginxplus-wallarm .
    ```
 3. Run the Docker image:
     ```bash
    docker run -d -e DEPLOY_USER='deploy@example.com' -e DEPLOY_PASSWORD='very_secret' -e WALLARM_API_HOST='us1.api.wallarm.com' -p 80:80 nginxplus-wallarm:latest
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
