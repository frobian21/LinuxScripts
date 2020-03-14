#!/bin/bash

#i=1

#while [ $i -le 10 ]
#do
#	j=1
#	while [ $j -le 10 ]
#	do
#		echo -n "$((i*j))	"
#		((j++))
#	done
#	echo 
#	((i++))
#done

for i in {1..10}
do
	for j in {1..10}
	do
	echo -n "$((i*j))	"
	done
	echo
	((i++))
done
	
