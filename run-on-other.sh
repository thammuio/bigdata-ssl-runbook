#!/bin/bash

#Copy the below from variables file
javahome=/usr/jdk64/latest
tlsdir=/bigdata/security/tls/

#run this only after copying the allcerts.tar file
echo "Copy all certs.tar file that was prepared"
tar -vxf allcerts.tar

sudo cp -r bigdata/security /bigdata/
sudo chmod 755 /bigdata/security

echo "Creating a privileged store starting with the one included in the JDK"
sudo cp $javahome/jre/lib/security/cacerts $javahome/jre/lib/security/jssecacerts

echo "Importing OUR CompanyCA file into the CA truststore"
sudo $javahome/bin/keytool -noprompt -importcert -trustcacerts -alias companyenterpriserootca -file $tlsdir/rootca/company.enterprise.ca.pem -keystore $javahome/jre/lib/security/jssecacerts -storepass changeit

sudo $javahome/bin/keytool -noprompt -importcert -trustcacerts -alias companyenterpriseinterca -file $tlsdir/rootca/company.enterprise.inter.ca.pem -keystore $javahome/jre/lib/security/jssecacerts -storepass changeit

sudo $javahome/bin/keytool -noprompt -importcert -trustcacerts -alias companyenterpriseinter2ca -file $tlsdir/rootca/company.enterprise.inter2.ca.pem -keystore $javahome/jre/lib/security/jssecacerts -storepass changeit


sudo cp $tlsdir/x509/`hostname -f`.pem $tlsdir/x509/cert.pem
sudo cp $tlsdir/x509/`hostname -f`.key $tlsdir/x509/key.pem
sudo cp $tlsdir/x509/`hostname -f`-keynopw.pem $tlsdir/x509/keynopw.pem
sudo cp $tlsdir/keystore/`hostname -f`.jks $tlsdir/keystore/keystore.jks
sudo cp $tlsdir/x509/`hostname -f`.crt $tlsdir/x509/cert.crt
sudo cp $tlsdir/x509/`hostname -f`.cer $tlsdir/x509/cert.cer
sudo cp $tlsdir/x509/`hostname -f`.key $tlsdir/x509/key.key
sudo cp $tlsdir/x509/`hostname -f`-keynopw.key $tlsdir/x509/keynopw.key