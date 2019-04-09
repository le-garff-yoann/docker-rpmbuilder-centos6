#!/bin/bash

if [[ -n $MAPPED_GID ]]
then
    sudo groupadd xrpmbuilder -g $MAPPED_GID
    sudo usermod rpmbuilder -aG $MAPPED_GID
fi

[[ -n $MAPPED_UID ]] && sudo useradd xrpmbuilder -u $MAPPED_UID -g $MAPPED_GID

exec "$@"
