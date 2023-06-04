#!bin/bash

                               
                               # GET ALL PREFIXES ASSIGNED AT A GIVEN AS AND STORE THEM IN "AS#_prefixes.txt"

                             
 curl -s --location --request GET "https://stat.ripe.net/data/announced-prefixes/data.json?resource=AS$1" > query_output.tmp.json

 # Check if there is one argument
 if (( $# < 2 )); then
    echo
    echo "Usage: ./ASscan.sh + AS# +  port"
    echo
    exit 1
 fi


 echo "$(<query_output.tmp.json)" | jq '.data.prefixes | .[] | .prefix' | sed 's/\"//g' > AS$1_prefixes.txt

 


  rm query_output.tmp.json
  
  
 output="$(/usr/bin/date +%Y%m%d_%H%M%S)""_output.txt"
 while read LINE  ; do
  
     masscan -p$2 $LINE  >> "$output"

 
done < AS$1_prefixes.txt
echo
echo "Results saved in current directory."

exit 0


                               
  


                          


