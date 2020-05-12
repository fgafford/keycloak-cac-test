#!/bin/bash

# Setup the Certificate Authority
cfssl gencert -initca local-ca.json | cfssljson -bare ca

# Create key and signing request
cfssl genkey local.json > out.json
jq -r '.key' < out.json > tls.key
jq -r '.csr' < out.json > tls.csr
rm out.json

# Sign the certificate
cfssl sign -ca ca.pem -ca-key ca-key.pem -hostname localhost,127.0.0.1,::1 tls.csr \
   | jq -r '.cert' > tls.crt 

# Move things where they need to be
mv ./tls.key ../certs/
mv ./tls.crt ../certs/
mv ./ca.pem ../certs/ca.crt

# Cleanup
