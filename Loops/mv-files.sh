#!/bin/bash

for file in $@; do
	mv $file "./Loops/$file.sh"
done
