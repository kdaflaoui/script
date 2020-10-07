#!/bin/bash

##############################################################
#
#	Description: deploiment un conteneur docker
#
#
#	Auteur : Karim
#
##############################################################


if  [ $1 == "--Create" ]; then
	echo "Create option..."

elif [ $1 == "--Drop" ]; then
	echo "Delete option..."

elif [ $1 == "--Info" ]; then
	echo "Info option..."

elif [ $1 == "--Start" ]; then
	echo "Restar option"

elif [ $1 == "--Ansible" ]; then
	echo "Ansible option..."

else
	echo "

		Options : 
			- -- Create : launch the caontainers
			- -- Drop : the containers created by deploy.sh
			- -- Infos : features of the  containers
			- -- Start : restart the containers
			- -- Ansible : doploy the ansible arborescence 
"
fi
