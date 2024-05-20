#!/bin/bash

mkdir -p pki tls

echo "> Generate keyfile..."
openssl rand -base64 756 > ${PWD}/pki/rs_keyfile
chmod 0600 ${PWD}/pki/rs_keyfile
echo "> Keyfile done!"

echo "> Generate CA File..."
openssl req -nodes -out tls/ca.pem \
  -new -x509 -keyout tls/ca.key \
  -subj "/C=FR/ST=Paris/L=Paris/O=josayko/OU=IT/CN=josayko.com/emailAddress=josayko@pm.me" \
  -quiet
echo "> CA File done!"

echo "> Generate Certificates..."
openssl req -nodes -newkey rsa:4096 -sha256 -keyout tls/mongodb_node_1.key \
  -out tls/mongodb_node_1.csr \
  -subj "/C=JP/ST=Tokyo/L=Tokyo/O=josayko/OU=MongoDB/CN=localhost/emailAddress=josayko@pm.me"
echo "> Certificates done!"

echo "> Signing Certificates..."
openssl x509 -req -in tls/mongodb_node_1.csr -CA tls/ca.pem -CAkey tls/ca.key \
  -set_serial 00 -out tls/mongodb_node_1.crt
echo "> Certificates signing done!"

# Concatenate each Certificate with its Key
cat tls/mongodb_node_1.key tls/mongodb_node_1.crt > tls/mongodb_node_1.pem

docker compose up -d

