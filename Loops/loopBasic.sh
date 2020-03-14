#!/bin/bash

echo "enter a value"
read value
echo "Start the loop"
echo "--------------"
i=1
while [ ${i} -le ${value} ]
do
	echo ${i}
	((i++))
done
echo "--------------"
