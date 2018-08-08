#!/bin/bash 
echo "creating .pem, .key, .keynopw (via .key) from pfx files .."
for i in `cat $clusternodes`; do \
sudo openssl pkcs12 -in $tlsdir/pfx/$pfx_prefix$i.pfx \
-clcerts \
-passin pass:$strpass \
-nokeys \
-out $tlsdir/x509/$pfx_prefix$i.pem
done

for i in `cat $clusternodes`; do \
sudo openssl pkcs12 -in $tlsdir/pfx/$pfx_prefix$i.pfx \
-passin pass:$strpass \
-passout pass:$strpass \
-nocerts \
-out $tlsdir/x509/$pfx_prefix$i.key
done

for i in `cat $clusternodes`; do \
sudo openssl pkcs12 -in $tlsdir/pfx/$pfx_prefix$i.pfx \
-nokeys \
-clcerts \
-passin pass:$strpass \
-out $tlsdir/x509/$pfx_prefix$i.crt
done

for i in `cat $clusternodes`; do \
sudo openssl x509 -in $tlsdir/x509/$pfx_prefix$i.crt \
-inform pem \
-outform der \
-out $tlsdir/x509/$pfx_prefix$i.cer
done

for i in `cat $clusternodes`; do
sudo openssl rsa \
-in $tlsdir/x509/$pfx_prefix$i.key \
-passin pass:$strpass \
-out $tlsdir/x509/$pfx_prefix$i-keynopw.pem
done

for i in `cat $clusternodes`; do
sudo openssl pkcs12 \
-in $tlsdir/pfx/$pfx_prefix$i.pfx -clcerts -nodes -nocerts \
-passin pass:$strpass | sudo openssl rsa > $tlsdir/x509/$pfx_prefix$i-keynopw.key
done

echo "done .."


