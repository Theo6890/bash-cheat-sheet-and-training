#!/bin/bash

a=(3 5 8 10 6)
b=(6 5 4 12)
c=(14 7 5 7)

for (( i = 0; i <  ${#a[@]}; i++)); do
	for (( j = 0; j < ${#b[@]}; j++ )); do
		if (( a[i] == b[j] ))
    	then
          #add result into an array at next free index
      		z[${#z[@]}]=${a[i]}
    	fi
  	done
done

#Verify if z array is empty
if (( ${#z[@]} == 0 ))
then
  echo "tab *z* empty"
  exit
fi

for (( i = 0; i <  ${#z[@]}; i++)); do
	for (( k = 0; k < ${#c[@]}; k++ )); do
		if ((  z[i] == c[k] ))
    	then
    	    #add result into an array at next free index
      		tmp[${#tmp[@]}]=${z[i]}
    	fi
  	done
done

z=("${tmp[@]}")
echo "common value =>" "${z[*]}"
