<img align="right" src="https://raw.github.com/cliffano/packer-studio/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/packer-studio/workflows/CI/badge.svg)](https://github.com/cliffano/packer-studio/actions?query=workflow%3ACI)
[![Docker Pulls Count](https://img.shields.io/docker/pulls/cliffano/studio.svg)](https://hub.docker.com/r/cliffano/studio/)
[![Vulnerability Scanning Status](https://snyk.io/test/github/cliffano/packer-studio/badge.svg)](https://snyk.io/test/github/cliffano/packer-studio)

Packer Studio
-------------

Packer Studio is a Packer builder of Docker image which contains the tech stacks that I use the most.

This image is used to launch a container for me to code in Go, Java, JavaScript, Python, Ruby, and Rust.

Installation
------------

Pull Studio Docker image from Docker Hub:

    docker pull cliffano/studio

Or alternatively, you can create the Docker image:

    git clone https://github.com/cliffano/packer-studio
    cd packer-studio
    make docker

An image with `cliffano/studio` repository and `latest` tag should show up:

    haku> docker images

    REPOSITORY                                       TAG                 IMAGE ID            CREATED             SIZE
    cliffano/studio                                  latest              3f45c1bc0e76        5 hours ago         1.5GB
    ubuntu                                           latest              735f80812f90        2 weeks ago         83.5MB

Usage
-----

Simply run a container using cliffano/studio image:

    docker run \
      --rm \
      --workdir /opt/workspace \
      -v /var/run/docker.sock:/var/run/docker.sock \
      -v $(pwd):/opt/workspace \
      -i -t cliffano/studio
