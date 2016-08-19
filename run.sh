#!/bin/sh
# Check for $CLIENT_URLS
if [ -z ${LISTEN_URLS+x} ]; then
        LISTEN_URLS="http://0.0.0.0:2379"
        echo "Using default LISTEN_URLS ($LISTEN_URLS)"
else
        echo "Detected new LISTEN_URLS value of $LISTEN_URLS"
fi

# Check for $PEER_URLS
if [ -z ${ADVERTISE_URLS+x} ]; then
        ADVERTISE_URLS="http://0.0.0.0:2380"
        echo "Using default ADVERTISE_URLS ($ADVERTISE_URLS)"
else
        echo "Detected new ADVERTISE_URLS value of $ADVERTISE_URLS"
fi

ETCD_CMD="/bin/etcd -data-dir=/data --advertise-client-urls=${ADVERTISE_URLS} -listen-client-urls=${LISTEN_URLS} $*"
echo -e "Running '$ETCD_CMD'\nBEGIN ETCD OUTPUT\n"

exec $ETCD_CMD
