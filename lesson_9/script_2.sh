#!/bin/bash

./strict.sh

oddDir="task_2/odd"
evenDir="task_2/even"

mkdir -p "${oddDir}" "${evenDir}"

for i in {1..20}; do
 if [[ $((i % 2)) -eq 0 ]]
		then
      file="${evenDir}/${i}.txt"	
		else
      file="${oddDir}/${i}.txt"
	fi
  touch "${file}"  
done
