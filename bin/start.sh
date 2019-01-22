#!/bin/bash

set -xe

# Setup the keys for nginx
cp -p $CERT_DIR/idp-proxy.chained.cer /etc/pki/nginx/
cp -p $CERT_DIR/idp-proxy.key /etc/pki/nginx/private/

# Setup the keys for simplesamlphp
cp -p $CERT_DIR/idp-proxy.cer /var/www/simplesamlphp/cert/
cp -p $CERT_DIR/idp-proxy.key /var/www/simplesamlphp/cert/

# Update DS metadata
/var/www/simplesamlphp/bin/update_ds_metadata.sh

/usr/bin/supervisord -n -c /etc/supervisord.conf