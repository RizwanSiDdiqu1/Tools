#!/bin/bash

waybackfile=$1
if [ -f $waybackfile ]
then
    for url in $(cat $waybackfile | grep -a -i \=http | qsreplace 'http://evil.com' )
    do
        title=$(curl -s -L $url | grep -i "<title>Evil.Com")
        if [[ ! -z "$title" ]]
        then
            echo "$url is \033[0;31mVulnerable\n" >> open_Vul.txt
        fi
    done

else
    echo "Please Enter Waybackurl File path:"
fi
