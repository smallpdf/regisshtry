# Regisshtry
Simplistic docker registry alternative. Docker save / load per ssh on remote host.

- Stores the images as tar files on disk (image: foo/bar -> /registry-path/foo/bar)
- Keeps every pushed image (foo/bar.1, foo/bar.2 ...)
- The newest image gets symlinked (foo/bar -> foo/bar.5)

Makes deployments as easy as:

```bash
ssh $REGISSHTRY_REMOTE cat ${REGISSHTRY_PATH}/${IMAGE} | docker load
```


## Installation
- Install the script regisshtry-receive into the remote hosts $PATH
- Set your local environment variables
  - REGISHHTRY_REMOTE to ssh login e.g. "user@remote-host"
  - REGISHHTRY_PATH to a remote path e.g. "/home/user/registry"
- Good to go


## Usage

## Push image

Push a local image to the registry

```bash
regisshtry-push image
```

## Pull image

Load a image from the registry

```bash
regisshtry-pull image
```
