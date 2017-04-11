# Lightweight Docker image with Activator 
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Based on [AlpineLinux](https://alpinelinux.org/), this image contains the latest Oracle Java 8 JDK and [Activator](https://www.lightbend.com/activator/download), including BASH in case you need to work with command line properly. The alpine image with Oracle Java 8 JDK comes from [this Minified Docker image](https://hub.docker.com/r/anapsix/alpine-java/)

## How to use it
This image will expose PORT 9000 and it uses the folder '/app' as base for execute your application. Then, mount your local project properly. If you have another container running your database, do not forget about linking such container.

### Starting it

*Foreground mode*
`$ docker run --name SOME_NAME -it -v LOCAL_PROJECT:/app -port 9000:9000 holandajunior/alpine-activator bash` 

*Detach mode*
`$ docker run -d --name SOME_NAME -it -v LOCAL_PROJECT:/app -port 9000:9000 holandajunior/alpine-activator bash`

When you have access to container, its base work directory was already set to '/app' folder. Then, you can execute `$ activator`; `$ activator run`; whatever...

When you had finished with container, do not quit it, just use `CTRL`+`P` and `CTRL`+`Q` to detach from container and being able to come back later with `$ docker attach CONTAINER_NAME_PREVIOUSLY_SET`.

### With database container
`$ docker run --name -it -v LOCAL_PROJECT:/app -port 9000:9000  --link DATABASE_CONTAINER_NAME_OR_ID holandajunior/alpine-activator bash`

### Coming back
If container has stopped, just start it again using the container's name: `$ docker start CONTAINER_NAME_PREVIOUSLY_SET`
