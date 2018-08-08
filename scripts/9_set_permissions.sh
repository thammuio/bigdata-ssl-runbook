#!/bin/bash

echo "changing the permissions as required .."
sudo chmod 0755 $tlsdir/
sudo chmod 0755 $tlsdir/rootca
sudo chmod 0755 $tlsdir/keystore
sudo chmod 0755 $tlsdir/pfx
sudo chmod 0755 $tlsdir/certs
sudo chmod 0755 $tlsdir/truststore
sudo chmod 0644 $tlsdir/x509/*
sudo chmod 0644 $tlsdir/rootca/*
sudo chmod 0644 $tlsdir/keystore/*
sudo chmod 0644 $tlsdir/pfx/*
sudo chmod 0644 $tlsdir/truststore/*
sudo chmod 0644 $tlsdir/x509/*
sudo chmod 0644 $tlsdir/ad-certs/*
sudo chmod 0644 $javahome/jre/lib/security/jssecacerts



