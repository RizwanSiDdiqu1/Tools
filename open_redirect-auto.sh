#!/bin/bash

waybackfile=$1
#payload=/mnt/f/wordlist/open-redirect.txt
count=0
if [ -f $waybackfile ]
then
    for url in $(cat $waybackfile)
    do
        echo "Url is picked"
        for pay in $(cat /mnt/f/wordlist/open-redirect.txt)
        do
            echo "Payload is Picked"
            final=$(echo $url |  grep -a -i \= | qsreplace $pay)
            #echo $final
            if [ ! -z "$final" ]
            then
                title=$(curl -s -L $final | grep -i "<title>Evil.Com")
                if [[ ! -z "$title" ]]
                then
                    ((count=count+1))
                    echo "$final is \033[0;31mVulnerable\n" | tee -a find-open-redirect.txt
                    if [[ $count -eq 1 ]]
                    then
                        break
                    fi
                fi
            fi
        done
    done

else
    echo "Please Enter Waybackurl File path:"
fi
