#!/bin/bash

echo "" > 1output.txt
hadoop fs -count -q -v /user/hive/warehouse/* | tr -s " " | while read var; do
count_var=$(echo $var | cut -d " " -f6)
(( "${count_var}" >= "1000" )) && echo $var | cut -f6,8 -d " " >> 1output.txt
done

