# etcd3

## Name
- xieyanze/etcd3

## Version
- 3.0.4

This image weighs in at 14 MB due to the inclusion of TLS support and etcdctl. The -data-dir is a volume mounted to /data, and the default ports are bound to Etcd3 and exposed.

Recently added a run script so that http is not hard-coded into the Dockerfile (for running over SSL). Just overwrite $LISTEN_URLS and $ADVERTISE_URLS at runtime (these are the listening URLs). You'll still need to set the -advertise-client-urls and -initial-advertise-peer-urls flags if the container will be part of a cluster.

Since the image uses an ENTRYPOINT it accepts passthrough arguments to etcd.

```shell
docker run --name etcd-v3.0.4 -d -v /data/etcd/:/data \
          -p 2379:2379 -p 2380:2380 xieyanze/etcd3:latest
```
