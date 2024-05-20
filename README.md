# dev-mongodb

## Get started
### Prerequisites
`docker`, `docker compose`, `openssl`

## Connection URI
```
mongodb://${MONGO_INITDB_ROOT_USERNAME}:${MONGO_INITDB_ROOT_PASSWORD}@localhost:27017/?replicaSet=rs&ssl=true&tlsAllowInvalidCertificates=true
```

## CLI connection with `mongosh`
```shell
mongosh --host rs/localhost  --port 27017 -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --tls --tlsAllowInvalidCertificates
```

## Good to know
- `--tlsAllowInvalidCertificates` is necessary because of self-signed TLS certificates
- `security.keyFile` is required when authorization is enabled with replica sets
- By default, `MONGO_INITDB_ROOT_USERNAME`:`MONGO_INITDB_ROOT_PASSWORD` = `admin:admin`
