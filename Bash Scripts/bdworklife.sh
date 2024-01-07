#!/bin/bash 
sh killjboss.sh
sh killjboss.sh
sh killjboss.sh
cd /home/khalid/repo/altCommon/Maven\ Build\ EAR
echo ================================================================staging===========================================================================================
mvn -T 1C clean install -Psohum
cd ~
sudo sh jboss-eap-7.1.0/bin/standalone.sh
