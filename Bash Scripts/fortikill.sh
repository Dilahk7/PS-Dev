jboss_processes=$(ps aux | grep forticlient | grep root)
first_jboss_pid=$(echo $jboss_processes | awk '{print $2}')   
sudo kill -9 $first_jboss_pid

jboss_processes=$(ps aux | grep forticlient | grep whoami)
first_jboss_pid=$(echo $jboss_processes | awk '{print $2}')   
sudo kill -9 $first_jboss_pid