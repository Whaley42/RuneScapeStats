#!/bin/bash

chmod 777 $0

base_url="https://secure.runescape.com/m=itemdb_oldschool/api/catalogue/items.json?category=1&alpha="
item=""
usage="Usage = -i {item}"
method="GET"

#exit if no parameters were sent
if [[ ! -n $1 ]]; 
then
	echo ${usage}
	exit 1
fi

#fill in sent parameters
while getopts "i:" opt; do
case $opt in
	i)item=$OPTARG;; 
	*)echo ${usage}
esac
done

response=$(curl -X ${method} ${base_url}${item})

#echo $response | jq ".items"


echo ${response} | jq ".items"




