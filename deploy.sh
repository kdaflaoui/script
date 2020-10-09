#!/bin/bash

##############################################################
#
#	Description: deploiment un conteneur docker
#
#
#	Auteur : Karim
#
##############################################################


if  [ $1 == "--create" ]; then
	
	echo""
	
	# define docker number
	nb_machine=1
	[ $2 != "" ] && nb_machine=$2
	
	# Setting min and max
	min=1
	max=0

	# Get idmax
	idmax=`docker ps -a --format '{{ .Names }}' | awk -F "-" '$0 ~ user"-alpine" { print $3 }'| sort -r | head -1`

	# resetting min and max
	min=$(($idmax + 1))
	max=$(($idmax + $nb_machine))

	for i in $(seq $min $max); do
		docker run -tid --name $USER-alpine-$i alpine:latest 
		echo "The container $USER-alpine-$i created"	
	done
	
	echo "Number of instance created is : $2 "	

elif [ $1 == "--drop" ]; then
	echo "Delete option..."
	docker rm -f $(docker ps | grep $USER-alpine | awk '{ print $1 }')

elif [ $1 == "--info" ]; then
	echo ""

elif [ $1 == "--start" ]; then
	echo ""
	docker start $(docker ps -a | grep $USER-alpine | awk '{ print $1 }')

elif [ $1 == "--ansible" ]; then
	echo ""

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
