### Response code checker

``` 
for url in $(cat alive_sub.txt);do curl -o /dev/null -s -w "%{http_code} -> " $url;echo  $url;done
```

Credit - https://twitter.com/Rizwan_SiDdiqu1?s=0
