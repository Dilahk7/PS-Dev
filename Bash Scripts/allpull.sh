echo "Enter a git command"
read cmd


echo ----------------------------------------------
cd /home/khalid/repo/entity/altauthenticationentity
echo Altauthenticationentity
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/entity/altanalyticsentity
echo Altanalyticsentity
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/entity/altcommonentity
echo Altcommonentity
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/entity/altdatahubentity
echo Altdatahubentity
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/entity/altdatamanagerentity
echo Altdatamanagerentity
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/entity/altentity
echo Altentity
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/entity/altrecruitentity
echo Altrecruitentity
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/entity/altsurveyentity
echo Altsurveyentity
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/entity/altworklifeentity
echo Altworklifeentity
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/entity/root-pom
echo root-pom
$cmd
echo ----------------------------------------------
cd /home/khalid/repo/altadhocreport
echo Altadhocreport
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/altAdmin
echo AltAdmin
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/altDrools
echo AltDrools
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/altRootPom
echo AltRootPom
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/altTimeOff
echo AltTimeOff
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/framework
echo framework
$cmd
echo ----------------------------------------------

cd /home/khalid/repo/altCommon
git restore 'Maven Build EAR/pom.xml'
echo AltCommon
$cmd
sh /home/khalid/shiftpom.sh
echo ----------------------------------------------

cd /home/khalid/repo/altWorklife
echo AltWorklife
$cmd
echo ----------------------------------------------
