# 6. Write a script to remove multiple spaces in a string.
$str =  "kube-system   coredns-869cb84759-drhbg                     1/1     Running   0          4h5m"

($str -split "\s+") -join " "
