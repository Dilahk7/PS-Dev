#!/bin/bash 
sh killjboss.sh
sh killjboss.sh
sh killjboss.sh

echo ====================================================sohum====================================================================
cd /home/khalid/repo/altAdmin/AmdinImport
mvn -T 1C clean install -Pprod -U

cd ~
sh admindist2war.sh
sudo sh jboss-eap-7.1.0/bin/standalone.sh
