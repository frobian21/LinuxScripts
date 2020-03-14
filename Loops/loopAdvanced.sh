#!/bin/bash

declare -a arrayVar
counter=1
echo "Number limit:"
read number
echo "-------------"
#while [ $counter -le $number ]
#do
#	arrayVar[$(($counter-1))]=$counter
#	((counter++))
#done
arrayVar=($(seq 1 1 $number))

for i in "${arrayVar[@]}"
do
	if [ $(($i%3)) -eq 0 ] && [ $(($i%5)) -eq 0 ]
	then
		echo FizzBuzz!
	elif [ $(($i%3)) -eq 0 ]
	then
		echo Fizz!
	elif [ $(($i%5)) -eq 0 ]
	then
		echo Buzz!
	else
		echo $i 
	fi
	((i++))
done

