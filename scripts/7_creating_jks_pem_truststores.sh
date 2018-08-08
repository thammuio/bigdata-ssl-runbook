#!/bin/bash 
echo "Creating jks/pem keystores...."
echo "Add company CA cert to truststore"

sudo $javahome/bin/keytool \
-noprompt \
-importcert \
-trustcacerts \
-alias companyenterpriseca \
-file $tlsdir/rootca/company.enterprise.ca.pem \
-keystore $tlsdir/truststore/truststore.jks \
-storepass $strpass

echo "Add company CA inter cert to truststore"
sudo $javahome/bin/keytool \
-noprompt \
-importcert \
-trustcacerts \
-alias companyenterpriseinterca \
-file $tlsdir/rootca/company.enterprise.inter.ca.pem \
-keystore $tlsdir/truststore/truststore.jks \
-storepass $strpass

echo "Add company CA inter2 cert to truststore"
sudo $javahome/bin/keytool \
-noprompt \
-importcert \
-trustcacerts \
-alias companyenterpriseinter2ca \
-file $tlsdir/rootca/company.enterprise.inter2.ca.pem \
-keystore $tlsdir/truststore/truststore.jks \
-storepass $strpass

echo "For each host add the cert to the truststore"
for i in `cat $adnodes`;
do
sudo $javahome/bin/keytool \
-noprompt \
-importcert \
-trustcacerts \
-alias $i \
-file $tlsdir/ad-certs/$i.pem \
-keystore $tlsdir/truststore/truststore.jks \
-storepass $strpass
done

echo "For each host add the cert to the truststore"
for i in `cat $clusternodes`; do
sudo $javahome/bin/keytool \
-noprompt \
-importcert \
-trustcacerts \
-alias $i \
-file $tlsdir/x509/$pfx_prefix$i.pem \
-keystore $tlsdir/truststore/truststore.jks \
-storepass $strpass
done


echo "create pem truststore. Because we're using a CA signed"
echo "cert, we put the CA cert chain into the pem truststore"

sudo cat $tlsdir/rootca/company.enterprise.ca.pem > /tmp/truststore.pem
sudo cat $tlsdir/rootca/company.enterprise.inter.ca.pem > /tmp/truststore.pem
sudo cat $tlsdir/rootca/company.enterprise.inter2.ca.pem > /tmp/truststore.pem

sudo mv /tmp/truststore.pem $tlsdir/truststore/truststore.pem

for i in `cat $clusternodes`; do
sudo cat $tlsdir/x509/$pfx_prefix$i.pem >> $tlsdir/truststore/truststore.pem
done


echo "Creating TAR file with all certs for distributing"
sudo tar cf allcerts.tar $tlsdir
sudo chmod 755  allcerts.tar

echo "completed creating all required certs and trust-store .."
echo "allcerts.tar created   .."
echo "Now copy allcerts.tar file to all other nodes and run run-on-other.sh"


