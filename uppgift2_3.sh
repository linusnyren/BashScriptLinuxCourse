#!/bin/bash
#Install sshpass to enable automatic password filling
sudo apt install sshpass -y

#ssh into the server using the sshpass command
sshpass -p "password" ssh -o StrictHostKeyChecking=no server@192.168.0.67


