#!/usr/bin/env sh

# Generate client private and public P-256 keys
openssl ecparam -name prime256v1 -genkey -noout -out private-key.pem
openssl ec -in private-key.pem -pubout -out public-key.pem

# Generate CSR
openssl req -config ./openssl.cnf -key private-key.pem -new -nodes -text -out certreq.pem

# Self-sign
openssl x509 -extfile openssl.cnf -in certreq.pem -out cert.pem -req -signkey private-key.pem -days 9500 -text -copy_extensions copy
