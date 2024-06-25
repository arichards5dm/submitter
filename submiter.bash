#!/bin/bash

function submitInfo() {
	export SUBMISSION_USERNAME="arichards5@dmacc.edu"
	read -sp "Enter SUBMISSION_PASSWORD: " key
	echo
	export SUBMISSION_PASSWORD="$key"
	x=0
	while [[ $x == 0 ]]; do
		read -p "Do we need to add a resource group variable? (y/N) : " ans
		if [[ $ans == 'y' || $ans == 'Y' ]]; then
			read -p "Enter the name of the resource group: " rgn
			read -p "Confirm $rgn (Y/n) : " confirm
			if [[ $ans == 'N' || $ans == 'n' ]]; then
				continue
			else
				export RESOURCE_GROUP="$rgn"
				x=1
			fi
		else
			x=1
		fi
	done
}

function checkInfo() {
	echo
	echo "---------------------"
	echo "SUBMISSION_USERNAME: $SUBMISSION_USERNAME"
	echo "---------------------"
	echo "SUBMISSION_PASSWORD: [hidden] "
	echo "---------------------"
	if [[ -n "$RESOURCE_GROUP" ]]; then
		echo "RESOURCE_GROUP: $RESOURCE_GROUP"
		echo "---------------------"
	fi
	echo
}

echo "Enter 'submitInfo' to enter the username and password."
echo "Enter 'checkInfo' to verify submission info."