#!/bin/bash

#arg=$1
#domain=$2

#case $arg in

#  -h)
#    echo -ne "useage of $0 -c domain_name\n"
#   ;;

#  -c)
#    found=$(curl -i  -H "Origin:evil.com"  $domain  | grep -i  'evil.com')
#    echo $found
#    if [ ! -z $found ]
#    then
	#telegram-send "Cors"
        #echo -ne "$domain"
    #fi
    #;;

  #*)
    #echo -ne "useage of $0 -c domain_name\n"
    #;;
#esac

### ===============================================


#!/bin/bash

arg=$1
urlpath=$2
#save=$3

case $arg in
  -h)
   echo -ne "useage of $0 -c waybackurl or gau url path and give domain name for to output\n"
   ;;

  -c)
   for domain in $(cat $urlpath)
   do
       found=$(curl -i -s -H "Origin:evil.com"  --max-time 5.5 $domain  | grep  -i 'access-control-allow-origin: evil.com')

       #echo $found
       if [[ $found == *"evil.com"* ]]
       then
           telegram-send "Cors"
           #telegram-send  "$domain"
           echo -ne "$domain"
           echo $domain >> target_$save/cors.txt
       fi
    done
    ;;
   *)
    echo -ne "useage of $0 -c waybackurl or gau url path\n"
    ;;
   #echo -ne "useage of $0 -c waybackurl or gau url path\n"
esac
