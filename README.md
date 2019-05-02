# u14_gnu_arm_embedded
Docker image for GNU ARM Embedded (C/C++) on Ubuntu 14.04

This repository is automatically build into an image on the Docker Hub.  
<a href="https://hub.docker.com/r/vidavidorra/u14_gnu_arm_embedded/" target="_blank"> <img src="https://www.docker.com/sites/default/files/legal/small_h.png" alt="docker"/> </a>

## Build status
| Branch  | Status                                         |
| ------- | ---------------------------------------------- |
| Master  | [![Build Status][badge-master]][shippable-ci]  |
| Develop | [![Build Status][badge-develop]][shippable-ci] |

## Docker tags
- Releases of this image result in Docker Hub images with the `release-<GitHub release tag>` tag.
- The latest release of this Docker image is available on Docker Hub with the `latest` tag, and is best suitable for production environments requiring the latest version.
- The `master` branch results in Docker Hub images with the `master` tag, and should not be used in a production environment.
- The `develop` branch results in Docker Hub images with the `develop` tag, and should not be used in a production environment.

## Ubuntu base
This image is build on top of [Shippable's Ubuntu 14.04 base image](https://hub.docker.com/r/drydock/u14), so all [tools](http://docs.shippable.com/ci/supported/#tools) installed on the base image are available by default.

## Available tools & libraries
In addition to the [tools](http://docs.shippable.com/ci/supported/#tools) installed on the base image, the tools listed below are installed in this image.

| tool                  | version               |
| --------------------- | --------------------- |
| gcc/g++               | 6.2.0 20160901        |
| arm-none-eabi-gcc     | 4.9.3 20150529        |
| dot                   | 2.36.0                |
| doxygen               | 1.8.13                |
| gcovr                 | 3.3                   |

| library               | version               |
| --------------------- | --------------------- |
| boost                 | 1.63.0                |

## How to use
### Shippable CI
Since this image is build on top of Shippable's Ubuntu 14.04 base image, it can easily be used in the Shippable CI. The example `shippalbe.yml` file below shows the basic of how to use this image, while the full documentation is available in the [Shippable docs](http://docs.shippable.com/ci/shippableyml/#pre_ci_boot).

```yml
language: none

build:
  pre_ci_boot:
    image_name: vidavidorra/u14_gnu_arm_embedded
    image_tag: latest
    pull: true

  ci:
    - arm-none-eabi-gcc --version
```

### Local
Running this image locally in an interactive terminal session
```shell
Jeroens-MacBook-Pro:~ jdebruijn$ docker pull vidavidorra/u14_gnu_arm_embedded
Jeroens-MacBook-Pro:~ jdebruijn$ docker run --rm -it vidavidorra/u14_gnu_arm_embedded
root@e712f34768ed:/# arm-none-eabi-gcc --version
```
or even as non-interactive session.
```shell
Jeroens-MacBook-Pro:~ jdebruijn$ docker pull vidavidorra/u14_gnu_arm_embedded
Jeroens-MacBook-Pro:~ jdebruijn$ docker run --rm vidavidorra/u14_gnu_arm_embedded -c "arm-none-eabi-gcc --version"
```




[shippable-ci]:     https://app.shippable.com/github/vidavidorra/u14_gnu_arm_embedded
[badge-master]:     https://api.shippable.com/projects/58b1ce8b734ba00500664990/badge?branch=master
[badge-develop]:    https://api.shippable.com/projects/58b1ce8b734ba00500664990/badge?branch=develop
