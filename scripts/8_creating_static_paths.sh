#!/bin/bash
sudo cp $tlsdir/x509/`hostname -f`.pem $tlsdir/x509/cert.pem
sudo cp $tlsdir/x509/`hostname -f`.key $tlsdir/x509/key.pem
sudo cp $tlsdir/x509/`hostname -f`-keynopw.pem $tlsdir/x509/keynopw.pem
sudo cp $tlsdir/keystore/`hostname -f`.jks $tlsdir/keystore/keystore.jks
sudo cp $tlsdir/x509/`hostname -f`.crt $tlsdir/x509/cert.crt
sudo cp $tlsdir/x509/`hostname -f`.cer $tlsdir/x509/cert.cer
sudo cp $tlsdir/x509/`hostname -f`.key $tlsdir/x509/key.key
sudo cp $tlsdir/x509/`hostname -f`-keynopw.key $tlsdir/x509/keynopw.key