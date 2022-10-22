#!/bin/bash

./strict.sh

echo "enter a number"

read -r number

devidedBy3=$(("$number" % 3))
devidedBy5=$(("$number" % 5))
devidedBy7=$(("$number" % 7))

if [[ "$devidedBy3" -eq 0 || "$devidedBy7" -eq 0 || "$devidedBy5" -eq 0 ]]
 then
  echo "divisible"
else 
  echo "not devisible"
fi
