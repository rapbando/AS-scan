#!bin/bash

                               
                               # GET ALL PREFIXES ASSIGNED AT A GIVEN COUNTRY, KEEP ONLY THE NETWORK ADDRESS AND STORE THEM IN "IPs.tmp"

                             
 curl -s --location --request GET "https://stat.ripe.net/data/announced-prefixes/data.json?resource=AS$1" > query_output.tmp.json

 # Check if there is one argument
 if (( $# < 1 )); then
    echo
    echo "Usage: ./ASscan.sh + number of AS"
    echo
    exit 1
 fi


 echo "$(<query_output.tmp.json)" | jq '.data.prefixes | .[] | .prefix' >> AS$1_prefixes.txt

 


  rm query_output.tmp.json


                               
  


                          


