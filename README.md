# docker-kube-sandbox

Docker in Docker image with shellinabox, kubectl and git based on docker image https://cloud.docker.com/repository/docker/mchebitou/docker-kube-sandbox

## Why?
Recently I had to build a lab for initiating new users to the use of Docker and Kubernetes, I needed a quick way to give those users access to a ready to use environment with all the necessary tools and enough security to make sure they don't break anything.
To make this image I took [fhuegli/docker-shellinabox](https://github.com/fhuegli/docker-shellinabox),
rebased it on [Docker official image](https://hub.docker.com/_/docker) and adapted it to suit my need.

## Install on Kubernetes

    $ kubectl apply -f kubernetes/configmap.yaml
    $ kubectl apply -f kubernetes/secret
    $ kubectl apply -f kubernetes/deployment.yaml
    $ kubectl apply -f kubernetes/service.yaml

Default credentials to login are :

    username: docker
    password: secret

## Configuration
### Available Environment Variables

 - **SIAB_USERCSS**: String of configured and enabled css extensions. Defaults to system default list.
 - **SIAB_PORT** The port where shellinabox should listen to. Defaults to 4200.
 - **SIAB_ADDUSER** Whether to create a default user. Defaults to true.
 - **SIAB_USER** The name of the user. Defaults to guest.
 - **SIAB_USERID** The numeric ID of the user. Defaults to 1000.
 - **SIAB_GROUP** The primary group of the user. Defaults to guest.
 - **SIAB_GROUPID** The numeric ID of the primary group of the user. Defaults to 1000.
 - **SIAB_PASSWORD** The password of the user. Defaults to an autogenerated password, printed out on stdout.
 - **SIAB_SHELL** The shell of the user. Defaults to /bin/bash.
 - **SIAB_HOME** The home directory of the user. Defaults to /home/guest.
 - **SIAB_SSL** Whether to enable ssl and create certificates on request. Defaults to true.
 - **SIAB_SERVICE** Service strings to use for shellinabox, separated by whitespace. Defaults to local logins */:LOGIN*.
 - **SIAB_PKGS** Packages to be installed before shellinabox starts. Defaults to none.
 - **SIAB_SCRIPT** Script to download and run before shellinabox start. SSL verification is disabled. Defaults to none.
