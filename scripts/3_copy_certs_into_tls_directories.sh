#!/bin/bash 
echo "converting Company CA .cer file to .pem" 
sudo cp -f $basedir/rootca-certs/company.enterprise.ca.cer $tlsdir/rootca/
sudo openssl x509 -in $tlsdir/rootca/company.enterprise.ca.cer -out $tlsdir/rootca/company.enterprise.ca.pem
sudo openssl x509 -outform der -in $tlsdir/rootca/company.enterprise.ca.pem -out $tlsdir/rootca/company.enterprise.ca.crt

echo "converting Company Intermediate CA .cer file to .pem" 
sudo cp -f $basedir/rootca-certs/company.enterprise.inter.ca.cer $tlsdir/rootca/
sudo openssl x509 -in $tlsdir/rootca/company.enterprise.inter.ca.cer -out $tlsdir/rootca/company.enterprise.inter.ca.pem
sudo openssl x509 -outform der -in $tlsdir/rootca/company.enterprise.inter.ca.pem -out $tlsdir/rootca/company.enterprise.inter.ca.crt

echo "converting Company Intermediate 2 CA .cer file to .pem" 
sudo cp -f $basedir/rootca-certs/company.enterprise.inter2.ca.cer $tlsdir/rootca/
sudo openssl x509 -in $tlsdir/rootca/company.enterprise.inter2.ca.cer -out $tlsdir/rootca/company.enterprise.inter2.ca.pem
sudo openssl x509 -outform der -in $tlsdir/rootca/company.enterprise.inter.ca.pem -out $tlsdir/rootca/company.enterprise.inter.ca.crt

for i in `cat $adnodes`;
do
echo "converting AD Company CA .cer file to .pem"
sudo cp -f $basedir/ad-certs/$i.cer $tlsdir/ad-certs/
sudo openssl x509 -in $tlsdir/ad-certs/$i.cer -out $tlsdir/ad-certs/$i.pem
done

echo "importing .jks files to $tlsdir/keystore/ .."
sudo cp -f jks-files/* $tlsdir/keystore/

echo "importing .pfx files to $tlsdir/pfx/ .." 
sudo cp -f pfx-files/* $tlsdir/pfx/


