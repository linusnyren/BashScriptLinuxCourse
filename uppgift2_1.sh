#!/bin/bash

#Using -qq flag to make the apt commands less noisy and -y to automatically respond yes
#Update package lists to get latest releases
sudo apt -qq update -y

#Use apt install to install packages, in this case nginx.
sudo apt -qq install nginx -y

#Remove the default landing page for nginx server
sudo rm /var/www/html/index.nginx-debian.html

#Create new index.html file
touch /var/www/html/index.html
#sudo chmod 777 /var/www/html/index.html

#Add text to index.html file using the HTML syntax
echo '<html><body><h1>Linus</h1></body></html>'  > /var/www/html/index.html

#restart the nginx service to make sure the page is refreshed
sudo systemctl restart nginx.service

#Install curl and print out the content of the page using curl
sudo apt -qq install curl -y
echo ---------------------------------
echo content of new HTML file below using CURL
curl localhost

#Monitor the acceslog in nginx and printout changes using the timeout command to set a duration
echo "Monitoring Acceslog for nginx for 20 seconds"
timeout 20 tail -f /var/log/nginx/access.log 


#Showing the nginx service information
top -p $(pgrep nginx | paste -s -d,)
