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
	
	nb_machine=1
	
	[ $2 != "" ] && nb_machine=$2
	
	for i in $(seq 1 $nb_machine); do
	
		docker run -tid --name $USER-alpine-$i alpine:latest 
		echo "The container $USER-alpine-$i created"	
	done
	
	echo "Number of instance created is : $2 "	

elif [ $1 == "--Drop" ]; then
	echo "Delete option..."
	docker rm -f $(docker ps | grep $USER-alpine | awk '{ print $1 }')

elif [ $1 == "--Info" ]; then
	echo "Info option..."

elif [ $1 == "--Start" ]; then
	echo "Restar option"
	for i in $(seq 1 10); do
		echo $i
	done

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
