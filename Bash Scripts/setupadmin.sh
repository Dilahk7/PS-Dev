#!/bin/bash

admin_import_pom="/home/khalid/admin_pom.xml"
admin_war="/home/khalid/Admin_WAR_pom.xml"
admin_ear="/home/khalid/Amin_EAR_POM.xml"

import_dst="/home/khalid/repo/altAdmin/AmdinImport/"
war_dist="/home/khalid/repo/altAdmin/Admin/AltAdminWAR/"
ear_dist="/home/khalid/repo/altAdmin/Admin/AltAdminEAR/"

new_file_name="pom.xml"

cp "$admin_import_pom" "$import_dst$new_file_name"
cp "$admin_war" "$war_dist$new_file_name"
cp "$admin_ear" "$ear_dist$new_file_name"


echo "loginthrougholdportal = true" >> /home/khalid/repo/altAdmin/Admin/AltAdminWAR/src/main/resources/sohum/alt_en.properties
echo "loginthrougholdportal = true" >> /home/khalid/repo/altAdmin/Admin/AltAdminWAR/src/main/resources/dev/alt_en.properties
echo "loginthrougholdportal = true" >> /home/khalid/repo/altAdmin/Admin/AltAdminWAR/src/main/resources/staging/alt_en.properties
echo "loginthrougholdportal = true" >> /home/khalid/repo/altAdmin/Admin/AltAdminWAR/src/main/resources/staging/alt_en_US.properties
echo "loginthrougholdportal = true" >> /home/khalid/repo/altAdmin/Admin/AltAdminWAR/src/main/resources/staging/altadmin.properties
