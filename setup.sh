#!/bin/bash

KEY_DIR="/vagrant/keys"

mkdir -p $KEY_DIR

# create key
ssh-keygen -t rsa -N "" -f /vagrant/keys/id_rsa.docker



