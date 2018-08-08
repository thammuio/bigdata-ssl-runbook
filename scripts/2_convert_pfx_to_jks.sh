#!/bin/bash
echo "Converting .pfx to .jks..."
[ -e /tmp/aliases.txt ] && rm -f /tmp/aliases.txt
rm -f jks-files/*
for i in `cat $clusternodes`;
do
alias_in_pfx=$(sudo $javahome/bin/keytool \
-noprompt \
-list \
-keystore pfx-files/$pfx_prefix$i.pfx \
-storetype PKCS12 \
-storepass $strpass \
| grep -i privatekeyentry \
| cut -d',' -f 1)
echo $i " " $alias_in_pfx >> /tmp/aliases.txt
done

while read i j;
do 
sudo $javahome/bin/keytool \
-noprompt \
-importkeystore \
-srckeystore pfx-files/$pfx_prefix$i.pfx \
-srcalias $j \
-destalias $i \
-srcstorepass $strpass \
-srcstoretype pkcs12 \
-destkeystore jks-files/$pfx_prefix$i.jks \
-deststoretype JKS \
-storepass $strpass
done < /tmp/aliases.txt
[ -e /tmp/aliases.txt ] && rm -f /tmp/aliases.txt
echo "Done"

#-deststoretype pkcs12
# Warning: The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS12 which is an industry standard