# What Do I DO

This runbook is to keystore, truststore, pem, ctr and other SSL Releated Files


## Runbook Contents
bigdata-ssl-runbook
	ad-certs
	ad-nodes  
	allcerts.tar
	cluster-nodes
	jks-files
	pfx-files
	README.md
	rootca-certs
	run-on-other.sh
	run.sh
	scripts
	variables


## Where to place the files - Directories
### ad-certs
Copy all Active direcotry Domain controller certs into `ad-certs` direcory with namig convention as FQDN.cer
	- It should be in Base-64 encoded .CER(.cer)

### jks-files
These files will be generated from the scripts using .pfx files

### pfx-files
Place all .pfx files for all `cluster-nodes`  with namig convention as FQDN.pfx

### rootca-certs
Place all Root and Subordinate CA certificate in this direcotry
	- with Naming convention as exactly below
		- `company.enterprise.ca.cer` for RootCA
		- `company.enterprise.inter.ca.cer` for subordinate RootCA
		- `company.enterprise.inter2.ca.cer` for second subordinate RootCA

### scripts
This contains all the scripts needed for the SSL

### allcerts.tar
This is the tar file that you will get after succusfull run, which you will use to copy into other nodes



## Required variables and Scripts - Files
### ad-nodes
List of all Active direcotry Domain controller FQDN's

### cluster-nodes
List of FQDN's for all nodes in the Cluster

### run-on-other.sh
Run this on the other cluster once`run.sh` is succesful in createing `allcerts.tar` and `scp allcerts.tar` to all other nodes in the cluster - and then run this script on those nodes

### run.sh
Run this on the Master server to create `allcerts.tar`

### variables
Modify it accordingly to fit to your cluster


