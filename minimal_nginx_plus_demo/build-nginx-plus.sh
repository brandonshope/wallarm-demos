#!/bin/bash
# Usage EXAMPLE: ./build-nginx-plus.sh ubuntu18.04
distro="$(tr [A-Z] [a-z] <<< "$1")" # set to lowercase

# Set build directory
build_dir=''

# Optional: Pull Git changes
# git pull --no-edit

#
# Build NGINX Plus Docker container
#

    # Set build directory
    build_dir='./NGINX-PLUS'
    
    # remove Dockerfile here (if exists)
    rm $build_dir/Dockerfile || true

    # copy desired Dockerfile
    cp Dockerfiles/$distro/Dockerfile $build_dir
    
    # Build and tag it as "nginx-plus-[distro]"
    docker build -t nginx-plus-$distro $build_dir --pull --no-cache # No caching

    # Show all docker containers build with names containing "nginx-plus-"
    printf "\n"
    printf "Nginx Plus containers built:"
    printf "\n"
    docker images | grep nginx-plus


# remove Dockerfile from the build directory (if exists)
rm $build_dir/Dockerfile || true