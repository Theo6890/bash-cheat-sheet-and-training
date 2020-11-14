#!/bin/bash

numbers=()
strings=()

for i in {0..2}
   do numbers[${#numbers[@]}]=$((i + 1))
done

strings=("hello" "world")

echo "${numbers[@]}"
echo "${strings[@]}"