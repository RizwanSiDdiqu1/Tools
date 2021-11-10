#!/bin/bash

file=$1

for i in $(cat $file | sed 's/https\?:\/\///')
do
   python3 ~/tools/ParamSpider/paramspider.py --domain $i -e js,css,style,jpg,png,svg,mp4
done
