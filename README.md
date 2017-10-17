# ubuntu-docker-devbox

## Configure development folder

If your projects are not on `~/Develop` run the following command:

```
ln -s <YOUR_FOLDER> ~/Develop
```

## Start / Install

```
vangrant up
```

## Open VM console

```
vagrant ssh
```

## Troubleshoot

### It appears your machine doesn't support NFS...

```
sudo apt install nfs-kernel-server -qqy
```
