#!/bin/bash 
echo "creating directory structure for the certs .."
sudo mkdir -p $tlsdir/rootca
sudo mkdir -p $tlsdir/keystore 
sudo mkdir -p $tlsdir/pfx
sudo mkdir -p $tlsdir/certs
sudo mkdir -p $tlsdir/truststore
sudo mkdir -p $tlsdir/x509
sudo mkdir -p $tlsdir/ad-certs

echo "changing the permissions as required .."
sudo chmod 0755 $tlsdir/
sudo chmod -R 0755 $tlsdir/rootca
sudo chmod -R 0755 $tlsdir/keystore
sudo chmod -R 0755 $tlsdir/pfx
sudo chmod -R 0755 $tlsdir/certs
sudo chmod -R 0755 $tlsdir/truststore
sudo chmod -R 0755 $tlsdir/x509
sudo chmod -R 0755 $tlsdir/ad-certs

