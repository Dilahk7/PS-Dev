file_name="/home/khalid/jboss-eap-7.1.0/standalone/deployments/altorganise.war.deployed"

if [ ! -e "$file_name" ]; then
    touch "altorganise.war.dodeploy"
    echo "Created $file_name"
else
    echo "$file_name already exists."
fi