# Docker CI Base, Standard

This is a Docker image which includes the standard packages/tools/components used in the Luminopia CI process. See the `Dockerfile` for more information.

## How to change stuff

1. Make changes in Dockerfile
2. `docker build .` to test
3. commit and push
4. [Trigger build](https://hub.docker.com/r/luminopia/ci-base-standard/~/settings/automated-builds/)
5. [Wait for build to finish](https://hub.docker.com/r/luminopia/ci-base-standard/builds/)

### Run container and test stuff

```sh
docker build .
# container-name should be output by `docker build` command, e.g. `b87b577abadd`
docker run -it container-name /bin/bash 
```

The Dockerfile we use has an `apt-get update` step, which can sometimes need to be refreshed to get updated package
information. In that case, you may want to build without the cached images:

```sh
docker build --no-cache .
```
