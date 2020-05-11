#!/bin/bash

NAME=keycloak
cont_name=`docker ps --filter "name=$NAME"  --format '{{.Names}}'`

docker exec -it $cont_name /opt/jboss/keycloak/bin/standalone.sh \
  -Djboss.socket.binding.port-offset=100 \
  -Dkeycloak.migration.action=export \
  -Dkeycloak.migration.provider=dir \
  -Dkeycloak.migration.realmName=cac-test-realm \
  -Dkeycloak.migration.dir=/tmp/configs

docker cp $cont_name:/tmp/configs/cac-test-realm-realm.json ./realms

