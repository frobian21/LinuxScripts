#!/bin/bash

i=19
while [ ${i} -ge 0 ]
do
 j=$((i + 1))
 mv -i "v($i).mp4" "capitulo_$j.mp4"
 ((i--))
done

