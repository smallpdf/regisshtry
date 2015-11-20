# Regisshtry

Super simplistic docker registry alternative. Docker save / load via ssh on remote host.

- Stores the images as tar files on a remote host
- Keeps every pushed image as independent tarball with incremental numbered file names
- Dependency-free (depends only common unix tools)


Makes deployments as easy as:

```bash
ssh $REGISSHTRY_REMOTE cat ${REGISSHTRY_PATH}/${IMAGE} | docker load
```

Using ssh agent forwarding you can avoid storing credentials on the host
you deploy to.


## File structure

`regishhtry-receive` receives docker images on the remote host.


It stores the images under following path:

```
${REGISSHTRY_PATH}/${IMAGE}     a symlink to the last pushed image.
${REGISSHTRY_PATH}/${IMAGE}.X   the actual image

```

where 

```
REGISSHTRY_PATH is a configurable path to the registry
IMAGE           is the image name e.g. smallpdf/example
X               is an auto-incrementing number
```


## Installation

- Set your local environment variables
  - `REGISHHTRY_REMOTE` to ssh login e.g. "user@remote-host"
  - `REGISHHTRY_PATH` to a remote path e.g. "/home/user/registry"
- Copy `regisshtry` to `/usr/local/bin` or where ever you want to install it
- Good to go


## Usage

## Push image

Push a local image to the registry

```bash
regisshtry push image
```

## Pull image

Load a image from the registry

```bash
regisshtry pull image
```

## Compare image

Check whether the local image and tha remote imaage are the same.  
Currently only compares the `latest` tag.

```bash
regishhtry compare image
```
