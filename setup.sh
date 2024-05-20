#!/bin/bash

mkdir -p pki certificates
openssl rand -base64 756 > ${PWD}/pki/rs_keyfile
chmod 0600 ${PWD}/pki/rs_keyfile

docker compose up -d

