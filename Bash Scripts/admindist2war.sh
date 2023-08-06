#!/bin/bash
sudo chmod 777 /home/khalid/repo/ -R
cd /home/khalid/repo/altAdmin/Admin/AltAdminWAR/angular
node --max_old_space_size=5072 ./node_modules/@angular/cli/bin/ng build --configuration=sohum --prod --output-hashing=all


# Set source and destination directories
src_dir=/home/khalid/repo/altAdmin/Admin/AltAdminWAR/angular/dist
dst_dir=/home/khalid/jboss-eap-7.1.0/standalone/deployments/AltAdminWAR.war

# Copy and replace files from source directory to destination directory
cp -r -f $src_dir/* $dst_dir/
